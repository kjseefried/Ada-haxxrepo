with Figure; use Figure;
with Atom; use Atom;
with Part; use Part;
package Solver is
	
	function Solve (Figure : in Part_Ptr; Parts : in Part_Ptr) 
				   return Boolean;
	
	function Place_Part (Part : in Part_Ptr) return Boolean;
end Solver;
