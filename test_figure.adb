with Figure; use Figure;
with Ada.Integer_Text_IO; use ada.Integer_Text_IO;

procedure Test_Figure is

    Figure : Figure_Ptr;

begin

    Figure := Create_Figure;

    put(Get_Max_X(Figure),0);

end Test_Figure;


