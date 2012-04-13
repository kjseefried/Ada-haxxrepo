

package body Solver is
	
	
	procedure Solve (Figure : in Figure_Ptr; Parts : in Figure_Ptr) is
		
		At_Part  : Integer := Get_Size(Parts) - 1; 
		--Start är end och move forward
		Poss_Lst : Atom_Ptr; -- List of possibilities
		Part     : Part_Ptr;
		Search   : Boolean := True;
		Forward  : Boolean := True;

	begin
		
		-- Possibilities is all the parts in the figure at first
		-- This get the first part, it may be more of them
		Poss_Lst := Get_Data(Figure);
		
		loop
			if Search then
				Part := Get_Part(Parts, At_Part);
			end if;
			
			if Forward then
				Set_Poss_List(Part, Poss_Lst);
			end if;
			
			
			-- If found position, move forward
			if Step_Forward(Part) then
				
				if At_Part = 0 then
					--LÖST!--
					return;
				end if;
				
				
				-- Exclude this part from the possibilities
				Poss_Lst := Exclude_Part(Poss_Lst, Part);
				At_Part  := At_Part - 1;
				Forward  := True;
				Search   := True;
				
				
			-- If no more move or rotate in part, move backwards in chain
			elsif No_More_Steps(Part) then
				if At_Part = Get_Size(Parts) then
					-- Omöjligt att lösa
					return;
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
