with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use Ada.Text_IO;


package body Part is

    ----------------------------------------------------------------------
    -- Create an empty Part
    ----------------------------------------------------------------------
    function Create_Part return Part_Ptr is
    begin
        return new Part_Type'(Size => 0,
							  Max_X => 0,
							  Max_Y => 0,
							  Max_Z => 0,
							  Min_X => 0,
							  Min_Y => 0,
							  Min_Z => 0,
							  Data  => Get_Atom_Null_Ptr,
							  Next => null);
    end Create_Part;


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

		if Get_X(Atom) > Get_Max_X(Part) then
			Set_Max_X(Part, Get_X(Atom));
		end if;

		if Get_Y(Atom) > Get_Max_Y(Part) then
			Set_Max_Y(Part, Get_Y(Atom));
		end if;

		if Get_Z(Atom) > Get_Max_Z(Part) then
			Set_Max_Z(Part, Get_Z(Atom));
		end if;


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

    function Contains (Part : in Part_Ptr; Atom : in Atom_Ptr)
					  return Boolean is
        temp_part : Part_Ptr := Part;
    begin
        loop
            if Atom = Get_Data(temp_part) then
                return true;
            end if;

			if Has_Next(temp_part) then
                temp_part := Get_Next(temp_part);
            else
				return false;
			end if;

        end loop;
    end Contains;

    ----------------------------------------------------------------------
    -- Checks if the part has a next element
    ----------------------------------------------------------------------
	function Has_Next (Part : in Part_Ptr) return Boolean is
	begin
		return Get_Next(Part) /= null;
	end Has_Next;

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
    function Get_Max_X (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Max_X;
    end Get_Max_X;

    ----------------------------------------------------------------------
    -- Sets the parts "Max_X" field to Val
    ----------------------------------------------------------------------
    procedure Set_Max_X (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Max_X := Val;
    end Set_Max_X;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Max_Y" field
    ----------------------------------------------------------------------
    function Get_Max_Y (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Max_Y;
    end Get_Max_Y;

    ----------------------------------------------------------------------
    -- Sets the parts "Max_Y" field to Val
    ----------------------------------------------------------------------
    procedure Set_Max_Y (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Max_Y := Val;
    end Set_Max_Y;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Max_Z" field
    ----------------------------------------------------------------------
    function Get_Max_Z (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Max_Z;
    end Get_Max_Z;

    ----------------------------------------------------------------------
    -- Sets the parts "Max_Z" field to Val
    ----------------------------------------------------------------------
    procedure Set_Max_Z (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Max_Z := Val;
    end Set_Max_Z;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Min_X" field
    ----------------------------------------------------------------------
    function Get_Min_X (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Min_X;
    end Get_Min_X;

    ----------------------------------------------------------------------
    -- Sets the parts "Min_X" field to Val
    ----------------------------------------------------------------------
    procedure Set_Min_X (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Min_X := Val;
    end Set_Min_X;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Min_Y" field
    ----------------------------------------------------------------------
    function Get_Min_Y (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Min_Y;
    end Get_Min_Y;

    ----------------------------------------------------------------------
    -- Sets the parts "Min_Y" field to Val
    ----------------------------------------------------------------------
    procedure Set_Min_Y (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Min_Y := Val;
    end Set_Min_Y;

    ----------------------------------------------------------------------
    -- Returns the value of the parts "Min_Z" field
    ----------------------------------------------------------------------
    function Get_Min_Z (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Min_Z;
    end Get_Min_Z;

    ----------------------------------------------------------------------
    -- Sets the parts "Min_Z" field to Val
    ----------------------------------------------------------------------
    procedure Set_Min_Z (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Min_Z := Val;
    end Set_Min_Z;














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
    -- Sets the parts "Max_X" field to Val
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

        Put_All(Get_Data(Part));
    end Put;

    ----------------------------------------------------------------------
    -- Rotates the whole part around the z-axis, modifies the Max fields
    ----------------------------------------------------------------------
    procedure Rotate_Z(Part : in Part_Ptr) is
        temp_atom : Atom_Ptr := Get_Data(Part);
        temp_max_x : constant Integer := -1 * Get_Max_X(Part);
        temp_part_x : Integer;
    begin
        Set_Max_X(Part,Get_Max_Y(Part));
        Set_Max_Y(Part,temp_max_x);

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
    -- Rotates the whole part around the x-axis, modifies the Max fields
    ----------------------------------------------------------------------
    procedure Rotate_X(Part : in Part_Ptr) is
        temp_atom : Atom_Ptr := Get_Data(Part);
        temp_max_z : constant Integer := -1 * Get_Max_Z(Part);
        temp_part_z : Integer;
    begin
        Set_Max_Z(Part,Get_Max_Y(Part));
        Set_Max_Y(Part,temp_max_z);

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
    -- Rotates the whole part around the y-axis, modifies the Max fields
    ----------------------------------------------------------------------
    procedure Rotate_Y(Part : in Part_Ptr) is
        temp_atom : Atom_Ptr := Get_Data(Part);
        temp_max_x : constant Integer := -1 * Get_Max_X(Part);
        temp_part_x : Integer;
    begin
        Set_Max_X(Part,Get_Max_Z(Part));
        Set_Max_Z(Part,temp_max_x);

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
    -- Rotates the whole part around the y-axis, modifies the Max fields
    ----------------------------------------------------------------------
	procedure Move_X (Part : in Part_Ptr; Value : in Integer) is
		Temp_Atom : Atom_Ptr := Get_Data(Part);
	begin
		Set_Max_X(Part, Get_Max_X(Part) + Value);

        loop
			Set_X(Temp_Atom, Get_X(Temp_Atom) + Value);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
			Temp_Atom := Get_Next(Temp_Atom);
        end loop;
	end Move_X;

	----------------------------------------------------------------------
    -- Rotates the whole part around the y-axis, modifies the Max fields
    ----------------------------------------------------------------------
	procedure Move_Y (Part : in Part_Ptr; Value : in Integer) is
		Temp_Atom : Atom_Ptr := Get_Data(Part);
	begin
		Set_Max_Y(Part, Get_Max_Y(Part) + Value);

        loop
			Set_Y(Temp_Atom, Get_Y(Temp_Atom) + Value);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
			Temp_Atom := Get_Next(Temp_Atom);
        end loop;
	end Move_Y;

	----------------------------------------------------------------------
    -- Rotates the whole part around the y-axis, modifies the Max fields
    ----------------------------------------------------------------------
	procedure Move_Z (Part : in Part_Ptr; Value : in Integer) is
		Temp_Atom : Atom_Ptr := Get_Data(Part);
	begin
		Set_Max_Z(Part, Get_Max_Z(Part) + Value);

        loop
			Set_Z(Temp_Atom, Get_Z(Temp_Atom) + Value);
			if not Has_Next(Temp_Atom) then
				return;
			end if;
			Temp_Atom := Get_Next(Temp_Atom);
        end loop;
	end Move_Z;


    ----------------------------------------------------------------------
    -- Removes a part, unallocates memory
    ----------------------------------------------------------------------
    procedure Free (Part : in out Part_Ptr) is
        procedure Free is
			new Ada.Unchecked_Deallocation(Object => Part_Type,
										   Name   => Part_Ptr);
    begin
        Free(Part);
        Part := null;
    end Free;

end;
