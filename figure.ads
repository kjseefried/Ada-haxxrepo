with Part; use Part;

package Figure is
	type Figure_Ptr is private;
	type Figure_Type is private;
	
	function Is_Null(Figure : in Figure_Ptr) return Boolean;
	function Create_Figure return Figure_Ptr;
	function Is_Empty (Figure : in Figure_Ptr) return Boolean;
	function Get_Size (Figure : in Figure_Ptr) return Integer;
	function Get_Data (Figure : in Figure_Ptr) return Part_Ptr;
	function Get_Part (Figure : in Figure_Ptr; Ctr : in Integer)return Part_Ptr;
	function Copy (Figure : in Figure_Ptr)return Figure_Ptr;
	
	procedure Set_Data (Figure : in Figure_Ptr; Part : in Part_Ptr);
	procedure Insert (Figure : in Figure_Ptr; Part : in Part_Ptr);
	procedure Free (Figure : in out Figure_Ptr);
	procedure Put (Figure : in Figure_Ptr);
	
private
	type Figure_Ptr is access Figure_Type;
	type Figure_Type is
	   record
		   Data : Part_Ptr;
		   Size : Integer;
	   end record;
	
end Figure;
