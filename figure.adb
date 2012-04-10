with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package body Figure is

    function Create_Figure ()
      return Figure_Ptr is
    begin
        Figure := new Figure_Type(
            Next  => null,
            Size  => 0,
            Max_X => 0,
            Max_Y => 0,
            Max_Z => 0);
        return Figure;
    end Create_Figure;

    function Get_Next(Figure : in Figure_Ptr) return Figure_Ptr type is
    begin
        return Figure.all.Next;
    end Get_Next;

    function Get_Max_X(Figure : in Figure_Ptr) return Integer type is
    begin
        return Figure.all.Max_X;
    end Get_Max_X;

    function Get_Max_Y(Figure : in Figure_Ptr) return Integer type is
    begin
        return Figure.all.Max_Y;
    end Get_Max_X;

    function Get_Max_Z(Figure : in Figure_Ptr) return Integer type is
    begin
        return Figure.all.Max_X;
    end Get_Max_Z;


    function Get_Size(Figure : in Figure_Ptr) return Integer type is
    begin
        return Figure.all.Size;
    end Get_Size;

end;