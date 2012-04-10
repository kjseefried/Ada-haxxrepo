with Ada.Unchecked_Deallocation;

package body Part is

    function Create_Part
      return Part_Ptr is
    begin
        return new Part_Type'(
            Size  => 0,
            Max_X => 0,
            Max_Y => 0,
            Max_Z => 0);
    end Create_Part;


    function Get_Max_X(Part : in Part_Ptr) return Integer is
    begin
        return Part.all.Max_X;
    end Get_Max_X;

    function Get_Max_Y(Part : in Part_Ptr) return Integer is
    begin
        return Part.all.Max_Y;
    end Get_Max_Y;

    function Get_Max_Z(Part : in Part_Ptr) return Integer is
    begin
        return Part.all.Max_X;
    end Get_Max_Z;


    function Get_Size(Part : in Part_Ptr) return Integer is
    begin
        return Part.all.Size;
    end Get_Size;

    procedure Free_Part(Part : in out Part_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Part_Type,
										   Name => Part_Ptr);
	begin
		Free(Part);
		Part := null;
	end Free_Part;

end;
