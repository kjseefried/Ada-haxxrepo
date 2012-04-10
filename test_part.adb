with Part; use Part;
with Ada.Integer_Text_IO; use ada.Integer_Text_IO;
with ada.Text_IO; use ada.Text_IO;

procedure Test_Part is

    Part : Part_Ptr;

begin

    Part := Create_Part;
    if Is_Empty(Part) then
        put(1,0);
    else
        put(0,0);
    end if;



end Test_Part;


