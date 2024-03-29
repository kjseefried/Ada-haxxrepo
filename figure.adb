with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Figure is
   
   --
   --
   --
   function Get_Rotation_Data (Figure : in Figure_Ptr) return String is
      Part : Part_Ptr;
      Data : Unbounded_String;
      Rot_X, Rot_Y, Rot_Z : Integer;
   begin
      
      Data := Trim(To_Unbounded_String(Integer'Image(Get_Size(Figure))), Ada.Strings.Left);
      for L in 1..Get_Size(Figure) loop
	 Part := Get_Order(Figure, L);
	 
	 Rot_X := Get_Rot_X(Part) mod 4;
	 Rot_Y := (Get_Rot_Y(Part) / 4) mod 4;
	 Rot_Z := (Get_Rot_Z(Part) / 16);
	 
	 Data := Data & " ! "
	   & Trim(To_Unbounded_String(Rot_X'img), Ada.Strings.Left) & " "
	   & Trim(To_Unbounded_String(Rot_Y'img), Ada.Strings.Left) & " "
	   & Trim(To_Unbounded_String(Rot_Z'img), Ada.Strings.Left) & " "
	   & Trim(To_Unbounded_String(Get_Move_X(Part)'img), Ada.Strings.Left) & " " 
	   & Trim(To_Unbounded_String(Get_Move_Y(Part)'img), Ada.Strings.Left) & " " 
	   & Trim(To_Unbounded_String(Get_Move_Z(Part)'img), Ada.Strings.Left) & " ";
	   
	 
      end loop;
      return To_String(Data);
   end Get_Rotation_Data;
   
   ---
   ---
   ---
   function Get_Order (Figure : in Figure_Ptr; Val : in Integer)
		     return Part_Ptr is
      Out_Of_Bounds : exception;
      Tmp_Part : Part_Ptr := Get_Data(Figure);
   begin
      if Val > Get_Size(Figure) then
	 raise Out_Of_Bounds;
      end if;
      
      for L in 1..Get_Size(Figure) loop
	 if (Get_Order(Tmp_Part) = Val) then
	    return Tmp_Part;
	 end if;
	 Tmp_Part := Get_Next(Tmp_Part);
      end loop;
      
      Put(Val);
      raise Out_Of_Bounds;
   end Get_Order;
	
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
	
	----------------------------------
	---
	---
	
	
	function Get_Part (Figure : in Figure_Ptr; Ctr : in Integer)
					  return Part_Ptr is
		Out_Of_Bounds : exception;
		Tmp_Part : Part_Ptr := Get_Data(Figure);
		Count : Integer := Ctr;
	begin
		if Ctr > Get_Size(Figure) then
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
