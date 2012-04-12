with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Part is

    function Create_Part return Part_Ptr is
        Part : Part_Ptr;
    begin
        Part := new Part_Type;
        Part.All.Size  := 0;
        Part.All.Max_X := 0;
        Part.All.Max_Y := 0;
        Part.All.Max_Z := 0;

        return Part;
    end Create_Part;


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

			if Is_Empty(Temp1) then
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

	function Has_Next (Part : in Part_Ptr) return Boolean is
	begin
		return Part.all.Next /= null;
	end Has_Next;


	function Get_Next (Part : in Part_Ptr) return Part_Ptr is
	begin
		return Part.all.Next;
	end Get_Next;


	procedure Set_Next (Part : in Part_Ptr; Next : in Part_Ptr) is
	begin
		Part.all.Next := Next;
	end Set_Next;

    function Get_Data (Part : in Part_Ptr) return Atom_Ptr is
    begin
        return Part.All.Data;
    end Get_Data;

    procedure Set_Data (Part : in Part_Ptr; Atom : in Atom_Ptr) is
    begin
		Part.all.Data := Atom;
    end Set_Data;


    function Get_Max_X (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Max_X;
    end Get_Max_X;

    procedure Set_Max_X (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Max_X := Val;
    end Set_Max_X;


    function Get_Max_Y (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Max_Y;
    end Get_Max_Y;

    procedure Set_Max_Y (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Max_Y := Val;
    end Set_Max_Y;


    function Get_Max_Z (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Max_Z;
    end Get_Max_Z;

    procedure Set_Max_Z (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Max_Z := Val;
    end Set_Max_Z;
	
	function Is_Null (Part : in Part_Ptr) return Boolean is
	begin
		return Part = null;
	end Is_Null;

    function Is_Empty (Part : in Part_Ptr) return Boolean is
    begin
        if Get_Size(Part) = 0 then
            return True;
        else
            return False;
        end if;
    end Is_Empty;

    function Get_Size (Part : in Part_Ptr) return Integer is
    begin
        return Part.All.Size;
    end Get_Size;

    procedure Set_Size (Part : in Part_Ptr; Val : in Integer) is
    begin
        Part.all.Size := Val;
    end Set_Size;
	
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

    procedure Put (Part : in Part_Ptr) is
    begin
        Put_All(Get_Data(Part));
    end Put;

    procedure Free (Part : in out Part_Ptr) is

        procedure Free is
			new Ada.Unchecked_Deallocation(
										   Object => Part_Type,
										   Name   => Part_Ptr);
    begin
        Free(Part);
        Part := null;
    end Free;

end;
