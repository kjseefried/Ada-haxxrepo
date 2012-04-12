with Ada.Unchecked_Deallocation;

package body Figure is
	
	function Create_Figure return Figure_Ptr is
		Figure : Figure_Ptr;
	begin
		Figure := new Figure_Type;
		Figure.all.Size := 0;
		return Figure;
	end Create_Figure;
	
	
	function Is_Empty (Figure : in Figure_Ptr) return Boolean is
	begin
		return Figure.all.Size = 0;
	end Is_Empty;
	
	
	function Get_Data (Figure : in Figure_Ptr) return Part_Ptr is
	begin
		return Figure.all.Data;
	end Get_Data;
	
	
	procedure Insert_Part (Figure : in out Figure_Ptr; Part : in Part_Ptr) is
		Temp1 : Figure_Ptr;
		Temp2 : Figure_Ptr;
	begin
		if not Has_Next(Figure) then
			
		end if;
		
		Temp1 := Figure;
		Temp2 := Figure;	
		
	end Insert_Part;
	
	
	procedure Free_Figure(Figure : in out Figure_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Figure_Type,
										   Name   => Figure_Ptr);
	begin
		Free(Figure);
		Figure := null;
	end Free_Figure;
	
	
end Figure;
