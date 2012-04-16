with Part; use Part;
with Atom; use Atom;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Figure; use Figure;
with Solver; use Solver;

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
	
	
	
	
	

	
	--  Reverse_Rotations(Part);
	--  Put(Part);
	--  for L in Counter..50000000 loop
	--  	Rotate_X(Part);
	--  end loop;
	
	--  for L in Counter..50000000 loop
	--  	if Counter mod 4 = 0 and Counter /= 0 then
	--  		Rotate_Y(Part);
	--  	end if;
	--  end loop;
	
	--  for L in Counter..50000000 loop
	--  	if Counter mod 16 = 0 and Counter /= 0 then
	--  		Rotate_Z(Part);
	--  	end if;
	--  end loop;
	
	--  Put(Part);
	--  Reverse_Rotations(Part);
	--  Put(Part);
	
	--  Put(Part);
	--  Reverse_Rotations(Part);
	--  Counter := 1;
	--  while Counter <= 5 loop
	--  	Rotate_X(Part);
	--  	if Counter mod 4 = 0 and Counter /= 0 then
	--  		Rotate_Y(Part);
	--  	end if;
	--  	if Counter mod 16 = 0 and Counter /= 0 then
	--  		Rotate_Z(Part);
	--  	end if;
	--  	Counter := Counter + 1;
	--  end loop;
	
	--  Put(Part);
	
	--  Set_Poss_List(Part2, Part);
	
	--  Put(Part2);
	
	--  if Step_Forward(Part2) then
	--  	Put_Line("--- Success ---");
	--  else
	--  	Put_Line("--Failed--");
	--  end if;
	

	
	--  Put(Part2);
	
	--  -- Rotation --
	--  Put_Line("------ROTATION-------");
    --  Part := Create_Part;
	--  Orig_Atom := Create_Atom(1,-1,0);
    --  Atom1 := Create_Atom(1,-1,0);
    --  Atom2 := Create_Atom(1,-1,0);
    --  Atom3 := Create_Atom(3,-1,0);
    --  Atom4 := Create_Atom(1,-2,0);
    --  Atom5 := Create_Atom(1,-3,0);
    --  Atom6 := Create_Atom(1,-3,0);

    --  Insert(Part, Atom1);
    --  Insert(Part, Atom2);
    --  Insert(Part, Atom3);
    --  Insert(Part, Atom4);
    --  Insert(Part, Atom5);


    --  Put(Part);

    --  New_Line(3);
    --  Rotate_z(Part);
    --  Put(Part);

    --  New_Line(3);
    --  Rotate_z(Part);
    --  Rotate_z(Part);
    --  Rotate_z(Part);
    --  Put(Part);

	--  if Orig_Atom = Atom1 then
	--  	Put_Line("Atom1 stämmer fint!");
	--  else
	--  	Put_Line("Test error! Atom1 stämmer inte med original-atom");
	--  end if;

    --  Free(Atom1);
    --  Free(Atom2);
    --  Free(Atom3);
	--  Free(Atom4);
	--  Free(Atom5);
	--  Free(Part);

	--  Put_Line("-----END ROTATION-----");

	--  New_Line(2);
	--  --Förflyttning--

	--  Put_Line("------FÖRFLYTTNING-------");
    --  Part := Create_Part;
    --  Atom1 := Create_Atom(0,0,0);
    --  Atom2 := Create_Atom(0,0,0);
    --  Atom3 := Create_Atom(0,0,0);
    --  Atom4 := Create_Atom(0,0,0);
    --  Atom5 := Create_Atom(0,0,0);
    --  Insert(Part, Atom1);
    --  Insert(Part, Atom2);
    --  Insert(Part, Atom3);
    --  Insert(Part, Atom4);
    --  Insert(Part, Atom5);

	--  Put(Part);

	--  Put_Line("Flytta +1 X, +2 Y, +3 Z");
	--  Move_X(Part, 1);
	--  Move_Y(Part, 2);
	--  Move_Z(Part, 3);
    --  Put(Part);

	--  Put_Line("Flytta -1 X, -2 Y, -3 Z");
	--  Move_X(Part, -1);
	--  Move_Y(Part, -2);
	--  Move_Z(Part, -3);
    --  Put(Part);


	--  Put_Line("------END FÖRFLYTTNING-------");
    --  new_line(2);


    --  put_line("-----------Contains------");

    --  if contains(part,atom1) then
    --      put_line("fuck yea");
	--  end if;

    --  if contains(part,atom6) then
    --      put_line("fuck yea2");
    --  else
    --      put_line("nope");
    --  end if;
    --  put("----end contains----");

    --  Free(Atom1);
    --  Free(Atom2);
    --  Free(Atom3);
	--  Free(Atom4);
	--  Free(Atom5);
	--  Free(Part);

end Test_Part;


