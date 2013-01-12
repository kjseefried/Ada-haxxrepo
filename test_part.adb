with Part; use Part;
with Atom; use Atom;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Figure; use Figure;

procedure Test_Part is

    Part0, Part1, Part2, Part3, Part4  : Part_Ptr;
	
    Atom1,
    Atom2,
    Atom3,
    Atom4,
    Atom5,
    Atom6,
	Atom7,
	Atom8,
	Atom9,
	Atom10 : Atom_Ptr;
	
	Atom11,
    Atom12,
    Atom13,
    Atom14,
    Atom15,
    Atom26,
	Atom27,
	Atom38,
	Atom39,
	Atom40 : Atom_Ptr;
	
	Figure1, Figure2 : Figure_Ptr := Create_Figure;
	
	Counter : Integer := 0;
begin
	
	
    Atom1 := Create_Atom(1,1,1);
    Atom2 := Create_Atom(2,1,1);
    Atom3 := Create_Atom(3,1,1);
    Atom4 := Create_Atom(1,1,2);
    Atom5 := Create_Atom(1,1,3);
    Atom6 := Create_Atom(1,2,3);	
	Atom7 := Create_Atom(2,2,3);
	Atom8 := Create_Atom(3,2,3);
	Atom9 := Create_Atom(2,3,3);
	Atom10 := Create_Atom(3,3,3);
	
	
    Atom11 := Create_Atom(1,1,1);
    Atom12 := Create_Atom(3,1,1);
    Atom13 := Create_Atom(2,1,1);
    Atom14 := Create_Atom(1,1,2);
    Atom15 := Create_Atom(1,1,3);
	
    Atom26 := Create_Atom(1,2,3);	
	Atom27 := Create_Atom(2,2,3);
	
	Atom38 := Create_Atom(3,2,3);
	Atom39 := Create_Atom(2,3,3);
	
	Atom40 := Create_Atom(3,3,3);
	
	
    --Atom15 := Create_Atom(1,1,1);	
	Part0 := Create_Part;
	Insert(Part0, Atom1);
	Insert(Part0, Atom2);
	Insert(Part0, Atom3);
	Insert(Part0, Atom4);
	Insert(Part0, Atom5);
	Insert(Part0, Atom6);
	Insert(Part0, Atom7);
	Insert(Part0, Atom8);
	Insert(Part0, Atom9);
	Insert(Part0, Atom10);

	Part1 := Create_Part;
	Part2 := Create_Part;
	Part3 := Create_Part;
	Part4 := Create_Part;
	
	Insert(Part1,Atom11);
	Insert(Part1,Atom12);
	Insert(Part1,Atom13);
	Insert(Part1,Atom14);
	Insert(Part1,Atom15);
	
	Insert(Part2,Atom26);
	Insert(Part2,Atom27);
	
	Insert(Part3,Atom38);
	Insert(Part3,Atom39);
	
	Insert(Part4,Atom40);
	
	Insert(Figure1, Part0);
	
	Insert(Figure2, Part1);
	Insert(Figure2, Part2);
	Insert(Figure2, Part3);
	Insert(Figure2, Part4);
	
	
	if Solve(Figure1, Figure2) then
		Put("SOLVED!");
		Put(Figure2);
	else
		Put("UNSOLVED!");
	end if;
	
	New_Line(10);
	Put(Part0);
	Rotate_X(Part0);
	New_Line;
	Put(Get_Rot_Cntr(Part0));
	
	
end Test_Part;


