with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use Ada.Text_IO;

package body Figure is
	
	--
	--
	--
	function Is_Null(Figure : in Figure_Ptr) return Boolean is
	begin
		return Figure = null;
	end Is_Null;

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
	
	function Copy (Figure : in Figure_Ptr) return Figure_Ptr is
	begin
		return new Figure_Type'(Size => Get_Size(Figure),
								Data => Copy(Get_Data(Figure)));
	end Copy;
	
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
	
	function Get_Part (Figure : in Figure_Ptr; Ctr : in Integer)
					  return Part_Ptr is
		Out_Of_Bounds : exception;
		Tmp_Part : Part_Ptr := Get_Data(Figure);
		Count : Integer := Ctr;
	begin
		if Ctr >= Get_Size(Figure) then
			raise Out_Of_Bounds;
		end if;
		
		while Count > 0 loop
			Tmp_Part := Get_Next(Tmp_Part);
			Count := Count - 1;
		end loop;
		
		return Tmp_Part;
	end Get_Part;
	
	---------------------------------------------------------------------------
	-- Insert a part in correct order
	---------------------------------------------------------------------------	
	procedure Insert (Figure : in Figure_Ptr; Part : in Part_Ptr) is
		Part_P : Part_Ptr;
		Temp1 : Part_Ptr;
		Temp2 : Part_Ptr;
	begin
		if Is_Empty(Figure) then
			Figure.all.Size := Figure.all.Size + 1;
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
	-- Set the part list of a figure
	---------------------------------------------------------------------------
	procedure Set_Data (Figure : in Figure_Ptr; Part : in Part_Ptr) is
	begin
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
