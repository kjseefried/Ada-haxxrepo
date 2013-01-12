with Ada.Text_IO; use Ada.Text_IO;
with Figure; use Figure;
with Part; use Part;
with Atom; use Atom;
with Solver; use Solver;


procedure Test_Figure is
	
	Figure1 : Figure_Ptr;
	Figure2 : Figure_Ptr;
	Part1, Part2   : Part_Ptr;
	Atom1, Atom2, Atom3   : Atom_Ptr;
	Atom4, Atom5, Atom6   : Atom_Ptr;
begin

	Part1 := Create_Part;
	Insert(Part1, Create_Atom(1,1,1));
	Insert(Part1, Create_Atom(1,2,1));
	Insert(Part1, Create_Atom(2,1,1));

	Figure1 := Create_Figure;
	Insert(Figure1, Part1);


	Part2 := Create_Part;
	Insert(Part2, Create_Atom(1,1,1));
	Insert(Part2, Create_Atom(1,2,1));
	Insert(Part2, Create_Atom(2,2,1));

	Figure2 := Create_Figure;
	Insert(Figure2, Part2);

	if Solve(Figure1, Figure2) then
		Put_Line("Löst");
	else
		Put_Line("Gick inte");
	end if;

	Put_Advanced(Part1);
	Put_Advanced(Part2);
	
end Test_Figure;
