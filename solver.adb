with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Solver is
	
	
	function Solve (Figure : in Figure_Ptr; Parts : in Figure_Ptr) 
				   return Boolean is
		
		At_Part  : Integer := Get_Size(Parts) - 1; 
		--Start är end och move forward
		Poss_Lst : Part_Ptr; -- List of possibilities
		Part     : Part_Ptr;
		Search   : Boolean := True;
		Forward  : Boolean := True;
		
		Tmp      : Integer := 0;
		
	begin
		
		for P in 0..(Get_Size(Parts) - 1) loop
			Tmp := Tmp + Get_Size(Get_Part(Parts, P));
		end loop;
		
		
		if Tmp /= Get_Size(Get_Data(Figure)) then
			return False;
		end if;
		
		-- Possibilities is all the parts in the figure at first
		-- This get the first part, it may be more of them
		Poss_Lst := Get_Data(Figure);
							Put(Parts);
		loop
			if Search then
				Part := Get_Part(Parts, At_Part);
			end if;
			
			if Forward then
				Set_Poss_List(Part, Poss_Lst);
			end if;
			
			
			-- If found position, move forward
			if Step_Forward(Part, Get_Data(Figure)) then
				
				if At_Part = 0 then
					-- FREA MINNE FÖR SISTA PARTEN!!!!!!!!!!!!
					return True;
				end if;
				
				
				-- Exclude this part from the possibilities
				Poss_Lst := Exclude_Part(Poss_Lst, Part);
				At_Part  := At_Part - 1;
				Forward  := True;
				Search   := True;
				
				
			-- If no more move or rotate in part, move backwards in chain
			elsif No_More_Steps(Part) then
				if At_Part = (Get_Size(Parts) - 1) then
					return false;
				end if;
				
				
				At_Part := At_Part + 1;
				Forward := False;
				Search  := True;
				
			-- If more moves, stay on this part
			else
				Forward := False;
				Search  := False;
			end if;
		end loop;
		
	end Solve;
	
	
end Solver;
