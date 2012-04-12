

package Figure is
	type Figure_Ptr is private;
	type Figure_Type is private;
	
	function Create_Figure return Figure_Ptr;
	function Has_Next (Figure : in out Figure_Ptr) return Boolean;
	
	procedure Insert_Part (Figure : in out Figure_Ptr; Part : in Part_Ptr);
	procedure Free_Figure (Figure : in out Figure_Ptr);
	
private
	type Figure_Ptr is access Figure_Type;
	type Figure_Type is
	   record
		   Data : Part_Ptr;
		   Next : Figure_Ptr;
	   end record;
	
end Figure;
