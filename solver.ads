with Figure; use Figure;
with Atom; use Atom;
with Part; use Part;
package Solver is
	
	function Solve (Figure : in Figure_Ptr; Parts : in Figure_Ptr) 
				   return Boolean;
	
end Solver;
