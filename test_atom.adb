with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Atom; use Atom;

procedure Test_Atom is

	Atom1,Atom2,Atom3,Atom4 : Atom_Ptr;

begin
	Atom1 := Create_Atom(1, 2, 3);
	Atom2 := Create_Atom(1, 2, 3);
	Atom3 := Create_Atom(4, 2, 3);
	Atom4 := Create_Atom(1, 2, 3);

	if Atom1 = Atom2 then
		Put("yess");
	end if;

	if Atom3 /= Atom4 then
		Put("nooo");
	end if;



end Test_Atom;
