with Ada.Unchecked_Deallocation;

package body Figure is

    function Create_Figure
      return Figure_Ptr is
    begin
        return new Figure_Type'(
            Next  => null,
            Size  => 0,
            Max_X => 0,
            Max_Y => 0,
            Max_Z => 0);
    end Create_Figure;

    function Get_Next(Figure : in Figure_Ptr) return Figure_Ptr is
    begin
        return Figure.all.Next;
    end Get_Next;

    function Get_Max_X(Figure : in Figure_Ptr) return Integer is
    begin
        return Figure.all.Max_X;
    end Get_Max_X;

    function Get_Max_Y(Figure : in Figure_Ptr) return Integer is
    begin
        return Figure.all.Max_Y;
    end Get_Max_Y;

    function Get_Max_Z(Figure : in Figure_Ptr) return Integer is
    begin
        return Figure.all.Max_X;
    end Get_Max_Z;


    function Get_Size(Figure : in Figure_Ptr) return Integer is
    begin
        return Figure.all.Size;
    end Get_Size;

    procedure Free_Figure(Figure : in out Figure_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Figure_Type,
										   Name => Figure_Ptr);
	begin
		Free(Figure);
		Figure := null;
	end Free_Figure;

end;
