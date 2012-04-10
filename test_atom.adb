with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Atom; use Atom;

procedure Test_Atom is

	Atom : Atom_Ptr;

begin
	Atom := Create_Atom(1, 2, 3);

	Put(Atom);
end Test_Atom;
