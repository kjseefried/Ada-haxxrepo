with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Figure; use Figure;
with Part; use Part;
with Atom; use Atom;

package body Solver is

	function Solve (Figure : in Part_Ptr; Parts : in Part_Ptr) 
				   return Boolean is
	begin
		if Is_Null(Parts) then
			return true;
		end if;

		loop
			Set_Poss_List(Parts, Copy(Figure));

			if not Place_Part(Parts) then
				return false;
			end if;

			exit when Solve(Get_Poss_List(Parts), Get_Next(Parts));
		end loop;

		return true;
	end Solve;

	function Place_Part (Part : in Part_Ptr) return Boolean is
		Orig_Part : Part_Ptr;
		Current_Part : Part_Ptr;
		Current_Place : Part_Ptr;
		Current_Cntr : Integer;
		Current_Rontr : Integer;
		Last_Move : Part_Ptr;
	begin
		Current_Place := Get_Poss_List(Part);
		Orig_Part := Copy(Part);
		Current_Part := Copy(Orig_Part);
		
		loop
			Current_Cntr := Get_Poss_Cntr(Current_Part);
			Current_Rontr := Get_Rot_Cntr(Current_Part);
			Current_Part := Copy(Orig_Part);
			Set_Poss_Cntr(Current_Part, Current_Cntr);
			Set_Rot_Cntr(Current_Part, Current_Rontr);

			for L in 1..Get_Poss_Cntr(Current_Part) loop
				Current_Place := Get_Next(Current_Place);

				-- If reach end of possibility list
				if Is_Null(Current_Place) then

					-- Get first avaible position
					Current_Place := Get_Poss_List(Current_Part);
					Reset_Poss_Cntr(Current_Part);

					-- If reach end of rotation, this fails
					if not Inc_Rot_Cntr(Current_Part) then
						return false;
					end if;
				end if;

			end loop;

			Move_To(Current_Part, Get_Data(Current_Place));

			if Contains(Get_Poss_List(Current_Part), Current_Part) then
				Exclude_Part(Get_Poss_List(Current_Part), Current_Part);
				return true;
			else
				Inc_Poss_Cntr(Current_Part);
			end if;


		end loop;
	end Place_Part;
	
end Solver;
