with Part; use Part;
with Ada.Integer_Text_IO; use ada.Integer_Text_IO;

procedure Test_Part is

    Part : Part_Ptr;

begin

    Part := Create_Part;

    put(Get_Max_X(Part),0);

end Test_Part;


