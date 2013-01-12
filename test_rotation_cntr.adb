with Part; use Part;
with Atom; use Atom;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Figure; use Figure;

procedure Test_Rotation_Cntr is
    Part1  : Part_Ptr;
	
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
begin
	
	
    Atom1 := Create_Atom(1,1,1);
    Atom2 := Create_Atom(1,2,1);
    Atom3 := Create_Atom(2,1,1);

    Atom4 := Create_Atom(1,1,2);
    Atom5 := Create_Atom(1,1,3);
    Atom6 := Create_Atom(1,2,3);	
	Atom7 := Create_Atom(2,2,3);
	Atom8 := Create_Atom(3,2,3);
	Atom9 := Create_Atom(2,3,3);
	Atom10 := Create_Atom(3,3,3);
	
	Part1 := Create_Part;
	Insert(Part1, Atom1);
	Insert(Part1, Atom2);
	Insert(Part1, Atom3);
	--Insert(Part1, Atom4);
	--Insert(Part1, Atom5);
	--Insert(Part1, Atom6);
--	Insert(Part1, Atom7);
--	Insert(Part1, Atom8);
--	Insert(Part1, Atom9);
--	Insert(Part1, Atom10);

	Put(Part1);
	for L in 1..64 loop
		if Inc_Rot_Cntr(Part1) then
			null;
		end if;
		Put(Part1);
		Put_Line("---------------------");
	end loop;
end;
