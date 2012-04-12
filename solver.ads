
package Solver is
	
	function Exclude_Part (List : in Part_Ptr; Exc : in Part_Ptr) 
						  return Part_Ptr;
	
	procedure Solve (Figure : in Figure; Parts : in Figure);
	
end Solver;
