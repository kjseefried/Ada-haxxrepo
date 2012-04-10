with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Soma; use Soma;

procedure Test_Soma is
	
	Soma : Soma_Ptr;
	
begin
	Soma := Create_Soma(1, 2, 3);
	
	if Get_X(Soma) /= 1 then
		Put_Line("ERROR: Get_X not asserted value");
	end if;
	
	if Get_Y(Soma) /= 2 then
		Put_Line("ERROR: Get_Y not asserted value");
	end if;
	
	if Get_Z(Soma) /= 3 then
		Put_Line("ERROR: Get_Z not asserted value");
	end if;
	
	Put_Line("Test is done");
end Test_Soma;
