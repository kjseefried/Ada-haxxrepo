with Figure; use Figure;
with Part; use Part;
with Atom; use Atom;


procedure Test_Figure is
	
	Figure : Figure_Ptr;
	Part1, Part2   : Part_Ptr;
	Atom11, Atom12, Atom13   : Atom_Ptr;
	Atom21, Atom22, Atom23   : Atom_Ptr;
begin
	
	Atom11 := Create_Atom(1,1,1);
	Atom12 := Create_Atom(2,2,2);
	Atom13 := Create_Atom(3,3,3);
	
	Atom21 := Create_Atom(1,1,1);
	Atom22 := Create_Atom(2,2,2);
	Atom23 := Create_Atom(3,3,3);
	
	Part1 := Create_Part;
	Insert(Part1, Atom11);
	Insert(Part1, Atom12);
	Insert(Part1, Atom13);
	
	Part2 := Create_Part;
	Insert(Part2, Atom21);
	Insert(Part2, Atom22);
	Insert(Part2, Atom23);
	
	Figure := Create_Figure;
	Insert(Figure, Part1);
	Insert(Figure, Part2);
	
	Put(Figure);
	
	Free(Figure);
	
	Free(Part1);
	Free(Part2);
	
	Free(Atom11);
	Free(Atom12);
	Free(Atom13);
	Free(Atom21);
	Free(Atom22);
	Free(Atom23);
	
	
end Test_Figure;
