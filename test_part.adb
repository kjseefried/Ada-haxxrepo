with Part; use Part;
with Atom; use Atom;
with Ada.Integer_Text_IO; use ada.Integer_Text_IO;
with ada.Text_IO; use ada.Text_IO;

procedure Test_Part is

    Part : Part_Ptr;
	Atom1, Atom2, Atom3 : Atom_Ptr;
	
begin
    Part := Create_Part;
	
	Atom1 := Create_Atom(13,37,1);
	Atom2 := Create_Atom(1,1,1);
	Atom3 := Create_Atom(3,3,3);
	Insert(Part, Atom1);
	Insert(Part, Atom2);
	Insert(Part, Atom3);
	Put(Part);

end Test_Part;


