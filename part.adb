with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Part is

    ----------------------------------------------------------------------
    -- Create an empty Part
    ----------------------------------------------------------------------
    function Create_Part return Part_Ptr is
    begin
        return new Part_Type'(Size => 0,
							  Data  => Get_Atom_Null_Ptr,
							  Next => null,
							  Rot_X => 0,
							  Rot_Y => 0,
							  Rot_Z => 0,
							  Rot_Cntr => 0,
							  Move_X => 0,
							  Move_Y => 0,
							  Move_Z => 0,
							  Poss_List => null,
							  Poss_Cntr => 0);
    end Create_Part;

	-----------------------------------------------------------------------
	-- Copy a part
	-----------------------------------------------------------------------
	function Copy (Part : in Part_Ptr) return Part_Ptr is
	begin
		return new Part_Type'(Size  => 0,
							  Data  => Get_Atom_Null_Ptr,
							  Next  => null,
							  Rot_X => Get_Rot_X(Part),
							  Rot_Y => Get_Rot_Y(Part),
							  Rot_Z => Get_Rot_Z(Part),
							  Rot_Cntr => Get_Rot_Cntr(Part),
							  Move_X => Get_Move_X(Part),
							  Move_Y => Get_Move_Y(Part),
							  Move_Z => Get_Move_Z(Part),
							  Poss_List => null,
							  Poss_Cntr => 0);
	end Copy;

    ----------------------------------------------------------------------
    -- Insert an atom in a part, increment the size of the part
    ----------------------------------------------------------------------
    procedure Insert (Part : in out Part_Ptr; Atom : in Atom_Ptr) is
        Temp1 : Atom_Ptr;
        Temp2 : Atom_Ptr;
    begin

		if Is_Empty(Part) then
			Set_Data(Part, Atom);
			Set_Size(Part, Get_Size(Part) + 1);
			return;
		end if;

		Set_Size(Part, Get_Size(Part) + 1);



        if Is_Empty(Part) then
            Set_Data(Part,Atom);
            return;
        end if;

        Temp1 := Get_Data(Part);
        Temp2 := Get_Data(Part);

        loop

			if not Has_Next(Temp2) then
				Set_Next(Temp2, Atom);
				return;
			end if;

            if Get_Z(Atom) <= Get_Z(Temp1) or
			  Get_Y(Atom) <= Get_Y(Temp1) or
			  Get_X(Atom) <= Get_X(Temp1) then

				if Temp1 = Temp2 then

					Set_Next(Atom, Get_Data(Part));
					Set_Data(Part,Atom);
					return;
				end if;

				Set_Next(Atom, Temp1);
				Set_Next(Temp2, Atom);
				return;
			end if;

			Temp2 := Temp1;
			Temp1 := Get_Next(Temp1);
        end loop;
    end Insert;

	---------------------------------------------------------------------------
	-- Set a new Poss_List, free's the old one if any
	---------------------------------------------------------------------------
	procedure Set_Poss_List (Part : in Part_Ptr; Poss : in Part_Ptr) is

	begin
		if Part.all.Poss_List /= null then
			Free_All(Part.all.Poss_List);
		end if;
		Part.all.Rot_Cntr := 0;
		Part.all.Poss_Cntr := 0;
		Part.all.Poss_List := Poss;
	end Set_Poss_List;

	---------------------------------------------------------------------------
	-- Moves a part to specific location
	---------------------------------------------------------------------------	
	procedure Move_To (Part : in Part_Ptr; To : in Atom_Ptr) is
		Offset_X : Integer;
		Offset_Y : Integer;
		Offset_Z : Integer;
	begin

		Offset_X := Get_X(To) - Get_X(Get_Data(Part));
		Offset_Y := Get_Y(To) - Get_Y(Get_Data(Part));
		Offset_Z := Get_Z(To) - Get_Z(Get_Data(Part));
		Move_X(Part, Offset_X);
		Move_Y(Part, Offset_Y);
		Move_Z(Part, Offset_Z);
		
	end Move_To;
	
	---------------------------------------------------------------------------
	-- Copies all parts in ´List´ but excludes all parts that ´Part´ contains
	---------------------------------------------------------------------------
	function Exclude_Part (List : in Part_Ptr; Part : in Part_Ptr)
						  return Part_Ptr is
		Tmp_Atom  : Atom_Ptr := Get_Data(List);
		New_List  : Part_Ptr := Copy(List);
	begin
		loop
			if not Contains(Part, Tmp_Atom) then
				Insert(New_List, Copy(Tmp_Atom));
			end if;

			if not Has_Next(Tmp_Atom) then
				return New_List;
			end if;
			Tmp_Atom := Get_Next(Tmp_Atom);
		end loop;
	end Exclude_Part;

	---------------------------------------------------------------------------
	-- Check if a part contains an atom
	---------------------------------------------------------------------------
    function Contains (Part : in Part_Ptr; Atom : in Atom_Ptr)
					  return Boolean is
        Temp_Atom : Atom_Ptr := Get_Data(Part);
    begin
        loop
            if Atom = Temp_Atom then
                return true;
            end if;

			if Has_Next(Temp_Atom) then

                Temp_Atom := Get_Next(Temp_Atom);
            else
				return false;
			end if;

        end loop;
    end Contains;

	---------------------------------------------------------------------------
	-- Check if a Dest part contains Src part
	---------------------------------------------------------------------------
      function Contains (Dest,Src : in Part_Ptr) return Boolean is
          temp_src : Atom_Ptr := Get_Data(Src);
      begin
          if Get_Size(Dest) >= Get_Size(Src) then
              loop
				  
                  if not Contains(Dest, Temp_Src)  then
                      return false;
                  end if;
				  
				  exit when not Has_Next(temp_src);
                  temp_src := Get_Next(temp_src);
              end loop;
              return true;
          else
              return false;
          end if;
      end Contains;

    ---------------------------------------------------------------------------
	-- Step forward
	---------------------------------------------------------------------------
	function Step_Forward(Part : in Part_Ptr; Figure : in Part_Ptr) 
						 return Boolean is
		No_Poss_List : exception;
		Tmp_Atom : Atom_Ptr;
	begin
		if Get_Poss_List(Part) = null then
			raise No_Poss_List;
		end if;

		loop
			if Get_Poss_Cntr(Part) >= Get_Size(Get_Poss_List(Part)) then
				if Get_Rot_Cntr(Part) = 64 then
					return False;
				end if;

				Part.Poss_Cntr := 0;
				Reverse_Rotations(Part);

				
				for L in 0..(Get_Rot_Cntr(Part) mod 4) loop
					Rotate_X(Part);
				end loop;
				for L in 0..((Get_Rot_Cntr(Part)/4) mod 4) loop
					Rotate_Y(Part);
				end loop;
				for L in 0..(Get_Rot_Cntr(Part)/16) loop
					Rotate_Z(Part);
				end loop;
				
				Set_Rot_Cntr(Part, Get_Rot_Cntr(Part) + 1);
			end if;
			Tmp_Atom := Get_Data(Get_Poss_List(Part));
			for L in 1..Get_Poss_Cntr(Part) loop
				Tmp_Atom := Get_Next(Tmp_Atom);
			end loop;
			Move_To(Part, Tmp_Atom);
			if Contains(Figure, Part) then
				Part.Poss_Cntr := Part.Poss_Cntr + 1;
				return True;
			end if;


			Part.Poss_Cntr := Part.Poss_Cntr + 1;
		end loop;
	end Step_Forward;
	
    ----------------------------------------------------------------------
    -- Checks if the part has more steps
    ----------------------------------------------------------------------
	function No_More_Steps (Part : in Part_Ptr) return Boolean is
	begin
		if Get_Poss_Cntr(Part) = Get_Size(Get_Poss_List(Part)) and
		  Get_Rot_Cntr(Part) = 64 then
			return True;
		end if;
		return False;
	end No_More_Steps;
	
    ----------------------------------------------------------------------
    -- Checks if the part has a next element
    ----------------------------------------------------------------------
	function Has_Next (Part : in Part_Ptr) return Boolean is
	begin
		return Get_Next(Part) /= null;
	end Has_Next;


	function Get_Poss_List (Part : in Part_Ptr) return Part_Ptr is
	begin
		return Part.all.Poss_List;
	end Get_Poss_List;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Next" field
    ----------------------------------------------------------------------
	function Get_Next (Part : in Part_Ptr) return Part_Ptr is
	begin
		return Part.all.Next;
	end Get_Next;

    ----------------------------------------------------------------------
    -- Sets the parts "Next" field to Next
    ----------------------------------------------------------------------
	procedure Set_Next (Part : in Part_Ptr; Next : in Part_Ptr) is
	begin
		Part.all.Next := Next;
	end Set_Next;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Rot_Cntr" field
    ----------------------------------------------------------------------
	function Get_Rot_Cntr (Part : in Part_Ptr) return Integer is
	begin
		return Part.all.Rot_Cntr;
	end Get_Rot_Cntr;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Poss_Cntr" field
    ----------------------------------------------------------------------
	function Get_Poss_Cntr (Part : in Part_Ptr) return Integer is
	begin
		return Part.all.Poss_Cntr;
	end Get_Poss_Cntr;
	
    ----------------------------------------------------------------------
    -- Sets the parts "Rot_Cntr" field to Val
    ----------------------------------------------------------------------
	procedure Set_Rot_Cntr (Part : in Part_Ptr; Val : in Integer) is
	begin
		Part.all.Rot_Cntr := Val;
	end Set_Rot_Cntr;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Data" field
    ----------------------------------------------------------------------
    function Get_Data (Part : in Part_Ptr) return Atom_Ptr is
    begin
        return Part.All.Data;
    end Get_Data;

    ----------------------------------------------------------------------
    -- Sets the parts "Data" field to Atom
    ----------------------------------------------------------------------
    procedure Set_Data (Part : in Part_Ptr; Atom : in Atom_Ptr) is
    begin
		Part.all.Data := Atom;
    end Set_Data;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Max_X" field
    ----------------------------------------------------------------------
    function Get_Rot_X (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Rot_X;
    end Get_Rot_X;

    ----------------------------------------------------------------------
    -- Sets the parts "Rot_X" field to Val
    ----------------------------------------------------------------------
    procedure Set_Rot_X (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Rot_X := Val;
    end Set_Rot_X;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Rot_Y" field
    ----------------------------------------------------------------------
    function Get_Rot_Y (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Rot_Y;
    end Get_Rot_Y;

    ----------------------------------------------------------------------
    -- Sets the parts "Rot_Y" field to Val
    ----------------------------------------------------------------------
    procedure Set_Rot_Y (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Rot_Y := Val;
    end Set_Rot_Y;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Rot_Z" field
    ----------------------------------------------------------------------
    function Get_Rot_Z (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Rot_Z;
    end Get_Rot_Z;

    ----------------------------------------------------------------------
    -- Sets the parts "Rot_Z" field to Val
    ----------------------------------------------------------------------
    procedure Set_Rot_Z (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Rot_Z := Val;
    end Set_Rot_Z;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Max_X" field
    ----------------------------------------------------------------------
    function Get_Move_X (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Move_X;
    end Get_Move_X;

    ----------------------------------------------------------------------
    -- Sets the parts "Move_X" field to Val
    ----------------------------------------------------------------------
    procedure Set_Move_X (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Move_X := Val;
    end Set_Move_X;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Move_Y" field
    ----------------------------------------------------------------------
    function Get_Move_Y (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Move_Y;
    end Get_Move_Y;

    ----------------------------------------------------------------------
    -- Sets the parts "Move_Y" field to Val
    ----------------------------------------------------------------------
    procedure Set_Move_Y (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Move_Y := Val;
    end Set_Move_Y;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Move_Z" field
    ----------------------------------------------------------------------
    function Get_Move_Z (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Move_Z;
    end Get_Move_Z;

    ----------------------------------------------------------------------
    -- Sets the parts "Move_Z" field to Val
    ----------------------------------------------------------------------
    procedure Set_Move_Z (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Move_Z := Val;
    end Set_Move_Z;

    ----------------------------------------------------------------------
    -- Checks if the part pointer is null
    ----------------------------------------------------------------------
	function Is_Null (Part : in Part_Ptr) return Boolean is
	begin
		return Part = null;
	end Is_Null;

    ----------------------------------------------------------------------
    -- Checks if the size of the part is zero
    ----------------------------------------------------------------------
    function Is_Empty (Part : in Part_Ptr) return Boolean is
    begin
        if Get_Size(Part) = 0 then
            return True;
        else
            return False;
        end if;
    end Is_Empty;

    ----------------------------------------------------------------------
    -- Returns the size of the part
    ----------------------------------------------------------------------
    function Get_Size (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Size;
    end Get_Size;

    ----------------------------------------------------------------------
    -- Sets the parts size
    ----------------------------------------------------------------------
    procedure Set_Size (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Size := Val;
    end Set_Size;

    ----------------------------------------------------------------------
    -- Prints all the atoms in the parts "Data" field
    ----------------------------------------------------------------------
	procedure Put_All (Part : in Part_Ptr) is
		Temp_Part : Part_Ptr := Part;
	begin
		loop
			Put_All(Get_Data(Temp_Part));
			Put_Line("-------------------");
			if not Has_Next(Temp_Part) then
				return;
			end if;
			Temp_Part := Get_Next(Temp_Part);
		end loop;
	end Put_All;


    ----------------------------------------------------------------------
    -- Prints one atom in the parts "Data" field
    ----------------------------------------------------------------------
    procedure Put (Part : in Part_Ptr) is
    begin
		if Get_Size(Part) > 0 then
			Put_All(Get_Data(Part));
		end if;
    end Put;

    ----------------------------------------------------------------------
    -- Rotates the whole part around the z-axis, modifies the Rot fields
    ----------------------------------------------------------------------
    procedure Rotate_Z(Part : in Part_Ptr) is
        temp_atom : Atom_Ptr := Get_Data(Part);
        temp_part_x : Integer;
    begin
		Set_Rot_Z(Part, Get_Rot_Z(Part) + 1);

		loop
            temp_part_x := -1 * Get_X(temp_atom);
            Set_X(temp_atom,Get_Y(temp_atom));
            Set_Y(temp_atom,temp_part_x);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
            temp_atom := Get_Next(temp_atom);
        end loop;
    end Rotate_Z;

    ----------------------------------------------------------------------
    -- Rotates the whole part around the x-axis, modifies the Rot fields
    ----------------------------------------------------------------------
    procedure Rotate_X(Part : in Part_Ptr) is
        temp_atom : Atom_Ptr := Get_Data(Part);
        temp_part_z : Integer;
    begin
		Set_Rot_X(Part, Get_Rot_X(Part) + 1);

        loop
            temp_part_z := -1 * Get_Z(temp_atom);
            Set_Z(temp_atom,Get_Y(temp_atom));
            Set_Y(temp_atom,temp_part_z);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
            temp_atom := Get_Next(temp_atom);
        end loop;
    end Rotate_X;

    ----------------------------------------------------------------------
    -- Rotates the whole part around the y-axis, modifies the Rot fields
    ----------------------------------------------------------------------
    procedure Rotate_Y(Part : in Part_Ptr) is
        temp_atom : Atom_Ptr := Get_Data(Part);
        temp_part_x : Integer;
    begin
		Set_Rot_Y(Part, Get_Rot_Y(Part) + 1);

        loop
            temp_part_x := -1 * Get_X(temp_atom);
            Set_X(temp_atom,Get_Z(temp_atom));
            Set_Z(temp_atom,temp_part_x);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
            temp_atom := Get_Next(temp_atom);
        end loop;
    end Rotate_Y;

    ----------------------------------------------------------------------
    -- Reverses all rotations done to a part
    ----------------------------------------------------------------------
    procedure Reverse_Rotations (Part : in Part_Ptr) is
    begin
        if Get_Rot_Z(Part) /= 0 then
            for z in 1..(4 - (Get_Rot_Z(Part) mod 4)) loop
                Rotate_Z(Part);
            end loop;
        end if;

        if Get_Rot_Y(Part) /= 0 then
            for y in 1..(4 - (Get_Rot_Y(Part)  mod 4)) loop
                Rotate_Y(Part);
            end loop;
        end if;

        if Get_Rot_X(Part) /= 0 then
            for x in 1..(4 - (Get_Rot_X(Part) mod 4)) loop
                Rotate_X(Part);
            end loop;
        end if;
	
		Set_Rot_Y(Part, 0);
		Set_Rot_X(Part, 0);
		Set_Rot_Z(Part, 0);
    end Reverse_Rotations;

    ----------------------------------------------------------------------
    -- Move the part
    ----------------------------------------------------------------------
	procedure Move_X (Part : in Part_Ptr; Value : in Integer) is
		Temp_Atom : Atom_Ptr := Get_Data(Part);
	begin
		Set_Move_X(Part, Get_Move_X(Part) + Value);

        loop
			Set_X(Temp_Atom, Get_X(Temp_Atom) + Value);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
			Temp_Atom := Get_Next(Temp_Atom);
        end loop;
	end Move_X;

	----------------------------------------------------------------------
    -- Move the part
    ----------------------------------------------------------------------
	procedure Move_Y (Part : in Part_Ptr; Value : in Integer) is
		Temp_Atom : Atom_Ptr := Get_Data(Part);
	begin
		Set_Move_Y(Part, Get_Move_Y(Part) + Value);

        loop
			Set_Y(Temp_Atom, Get_Y(Temp_Atom) + Value);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
			Temp_Atom := Get_Next(Temp_Atom);
        end loop;
	end Move_Y;

    ----------------------------------------------------------------------
    -- Move the part
    ----------------------------------------------------------------------
	procedure Move_Z (Part : in Part_Ptr; Value : in Integer) is
		Temp_Atom : Atom_Ptr := Get_Data(Part);
	begin
		Set_Move_Z(Part, Get_Move_Z(Part) + Value);

        loop
			Set_Z(Temp_Atom, Get_Z(Temp_Atom) + Value);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
			Temp_Atom := Get_Next(Temp_Atom);
        end loop;
	end Move_Z;

     ----------------------------------------------------------------------
    -- Unallocates memory for a part
    ----------------------------------------------------------------------
    procedure Free (Part : in out Part_Ptr) is
        procedure Free is
			new Ada.Unchecked_Deallocation(Object => Part_Type,
										   Name   => Part_Ptr);
    begin
        Free(Part);
        Part := null;
    end Free;

    ----------------------------------------------------------------------
    -- Unallocates memory for a part and all its atoms
    ----------------------------------------------------------------------
	procedure Free_All (Part : in out Part_Ptr) is
        procedure Free is
			new Ada.Unchecked_Deallocation(Object => Part_Type,
										   Name   => Part_Ptr);
		Tmp_Data : Atom_Ptr;
    begin

		if Get_Size(Part) > 0 then
			Tmp_Data := Get_Data(Part);
			Free_List(Tmp_Data);
		end if;

        Free(Part);
        Part := null;
    end Free_All;

end;
