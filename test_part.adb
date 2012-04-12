with Part;
use Part;
with Atom;
use Atom;
with Ada.Text_IO;
use Ada.Text_IO;

procedure Test_Part is

    Part  : Part_Ptr;
    Atom1,
    Atom2,
    Atom3,
    Atom4,
    Atom5 : Atom_Ptr;

begin
    Part := Create_Part;

    Atom1 := Create_Atom(1,-1,0);
    Atom2 := Create_Atom(1,-1,0);
    Atom3 := Create_Atom(3,-1,0);
    Atom4 := Create_Atom(1,-2,0);
    Atom5 := Create_Atom(1,-3,0);
    Insert(Part, Atom1);
    Insert(Part, Atom2);
    Insert(Part, Atom3);
    Insert(Part, Atom4);
    Insert(Part, Atom5);
    Put(Part);
    New_Line(3);
    Rotate_z(Part);
    Put(Part);
    New_Line(3);
    Rotate_z(Part);
    Rotate_z(Part);
    Rotate_z(Part);
    Put(Part);

    Free(Atom1);
    Free(Atom2);
    Free(Atom3);
Free(Atom4);
Free(Atom5);

end Test_Part;


