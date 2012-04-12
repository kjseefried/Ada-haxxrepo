with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use Ada.Text_IO;

package body Figure is
	
	---------------------------------------------------------------------------
	-- Create an empty Figure
	---------------------------------------------------------------------------
	function Create_Figure return Figure_Ptr is
		Figure : Figure_Ptr;
	begin
		Figure := new Figure_Type;
		Figure.all.Size := 0;
		return Figure;
	end Create_Figure;
	
	
	---------------------------------------------------------------------------
	-- Get the size of a figure
	---------------------------------------------------------------------------
	function Get_Size (Figure : in Figure_Ptr) return Integer is
	begin
		return Figure.all.Size;
	end Get_Size;
	
	
	---------------------------------------------------------------------------
	-- Check if figure has no parts
	---------------------------------------------------------------------------
	function Is_Empty (Figure : in Figure_Ptr) return Boolean is
	begin
		return Get_Size(Figure) = 0;
	end Is_Empty;
	
	
	---------------------------------------------------------------------------
	-- Get the first part of the list of parts.
	---------------------------------------------------------------------------
	function Get_Data (Figure : in Figure_Ptr) return Part_Ptr is
	begin
		return Figure.all.Data;
	end Get_Data;
	
	
	---------------------------------------------------------------------------
	-- Insert a part in correct order
	---------------------------------------------------------------------------	
	procedure Insert (Figure : in Figure_Ptr; Part : in Part_Ptr) is
		Part_P : Part_Ptr;
		Temp1 : Part_Ptr;
		Temp2 : Part_Ptr;
	begin
		if Is_Empty(Figure) then
			-- Set_Data ökar även storlek med 1
			Set_Data(Figure, Part);
			return;
		end if;

		Figure.all.Size := Figure.all.Size + 1;
		
		Temp1 := Get_Data(Figure);
		Temp2 := Get_Data(Figure);
		
		loop
			if Is_Null(Temp1) then
				Set_Next(Temp2, Part);
				return;
			end if;
			
			if Get_Size(Temp1) > Get_Size(Part) then
				if Temp1 = Temp2 then
					Set_Next(Part, Temp1);
					Set_Data(Figure, Part);
					return;
				end if;
				
				Set_Next(Part, Temp1);
				Set_Next(Temp2, Part);
				return;
			end if;
			
			Temp2 := Temp1;
			Temp1 := Get_Next(Temp1);
		end loop;
		
	end Insert;
	
	
	---------------------------------------------------------------------------
	-- Set the part list of a figure, increases Size by one.
	---------------------------------------------------------------------------
	procedure Set_Data (Figure : in Figure_Ptr; Part : in Part_Ptr) is
	begin
		Figure.all.Size := Figure.all.Size + 1;
		Figure.all.Data := Part;
	end Set_Data;
	
	procedure Free(Figure : in out Figure_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Figure_Type,
										   Name   => Figure_Ptr);
	begin
		Free(Figure);
		Figure := null;
	end Free;
	
	
	---------------------------------------------------------------------------
	-- Put all parts in the part list
	---------------------------------------------------------------------------
	procedure Put(Figure : in Figure_Ptr) is
	begin
		Put_All(Get_Data(Figure));
	end Put;
	
end Figure;
