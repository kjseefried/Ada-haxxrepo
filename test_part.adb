with Part;
use Part;
with Atom;
use Atom;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Figure; use Figure;

procedure Test_Part is

    Part, Part2, Part3, Part4  : Part_Ptr;
    Atom1,
    Atom2,
    Atom3,
    Atom4,
    Atom5,
    Atom6,
	Orig_Atom: Atom_Ptr;
	Figure : Figure_Ptr := Create_Figure;
	
	Counter : Integer := 1;
begin
	
	
	
	-- Exclude--
    Atom1 := Create_Atom(1,1,1);
    Atom2 := Create_Atom(2,2,2);
    Atom3 := Create_Atom(3,3,3);
	
    Atom4 := Create_Atom(1,1,1);
    Atom5 := Create_Atom(2,2,2);
    Atom6 := Create_Atom(3,3,3);	
	
	Part := Create_Part;
	Insert(Part, Atom1);
	Insert(Part, Atom2);
	--Insert(Part, Atom3);
	
	Part2 := Create_Part;
	Insert(Part2, Atom4);
	Insert(Part2, Atom5);
	Insert(Part2, Atom6);

	Insert(Figure, Part);
	Insert(Figure, Part2);
	
	if Contains(Part2, Part) then
		Put("Japp");
	else
		Put("Nopp");
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


