with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Atom; use Atom;

procedure Test_Atom is
	
	Atom : Atom_Ptr;
	
begin
	Atom := Create_Atom(1, 2, 3);
	
	if Get_X(Atom) /= 1 then
		Put_Line("ERROR: Get_X not asserted value");
	end if;
	
	if Get_Y(Atom) /= 2 then
		Put_Line("ERROR: Get_Y not asserted value");
	end if;
	
	if Get_Z(Atom) /= 3 then
		Put_Line("ERROR: Get_Z not asserted value");
	end if;
	
	Put_Line("Test is done");
end Test_Atom;
