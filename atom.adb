with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Atom is
	
	---------------------------------------------------------------------------
	-- Creates an Atom an initialize all coordinates to 0 and sets Next to null.
	---------------------------------------------------------------------------
	function Create_Atom(X, Y, Z : Integer) return Atom_Ptr is
	begin
		return new Atom_Type'(Next => null,
							  X => X,
							  Y => Y,
							  Z => Z);
	end Create_Atom;


	---------------------------------------------------------------------------
	-- Get the X coordinate of an Atom
	---------------------------------------------------------------------------
	function Get_X(Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.X;
	end Get_X;


	---------------------------------------------------------------------------
	-- Get the Y coordinate of an Atom
	---------------------------------------------------------------------------
	function Get_Y(Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.Y;
	end Get_Y;


	---------------------------------------------------------------------------
	-- Get the Z coordinate of an Atom
	---------------------------------------------------------------------------
	function Get_Z(Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.Z;
	end Get_Z;

	
	
	---------------------------------------------------------------------------
	-- Set the X coordinate of an Atom
	---------------------------------------------------------------------------
	procedure Set_X(Atom : in Atom_Ptr; X : in Integer) is
	begin
		Atom.all.X := X;
	end Set_X;

	---------------------------------------------------------------------------
	-- Set the Y coordinate of an Atom
	---------------------------------------------------------------------------
	procedure Set_Y(Atom : in Atom_Ptr; Y : in Integer) is
	begin
		Atom.all.Y := Y;
	end Set_Y;

	---------------------------------------------------------------------------
	-- Set the Z coordinate of an Atom
	---------------------------------------------------------------------------
	procedure Set_Z(Atom : in Atom_Ptr; Z : in Integer) is
	begin
	   Atom.all.Z := Z;
	end Set_Z;
	
	
	---------------------------------------------------------------------------
	-- Get the next Atom in the list.
	---------------------------------------------------------------------------
	function Get_Next(Atom : in Atom_Ptr) return Atom_Ptr is
	begin
		return Atom.all.Next;
	end Get_Next;
	
	
	---------------------------------------------------------------------------
	-- Set the the next element of an Atom
	---------------------------------------------------------------------------
	procedure Set_Next(Atom : in Atom_Ptr; Next : in Atom_Ptr) is
	begin

		Atom.all.Next := Next;

	end Set_Next;
	

	---------------------------------------------------------------------------
	-- Checks if the given Atom_Ptr is null
	---------------------------------------------------------------------------
	function Is_Empty(Atom : in Atom_Ptr) return Boolean is
	begin
		return Atom = null;
	end Is_Empty;
	
	
    ---------------------------------------------------------------------------
	-- Put an atom
	---------------------------------------------------------------------------
	procedure Put(Atom : in Atom_Ptr) is
       begin
           Put(Get_X(Atom),0);
           Put(" ");
           Put(Get_Y(Atom),0);
           Put(" ");
           Put(Get_Z(Atom),0);
      end Put;
	  
	  
    ---------------------------------------------------------------------------
	-- Put a list of atoms
	---------------------------------------------------------------------------
	procedure Put_All(Atom : in Atom_Ptr) is
           temp : Atom_Ptr := Atom;
       begin
           while not Is_Empty(temp) loop
               Put(temp);
               New_Line;
               temp := temp.all.Next;
           end loop;
       end Put_All; 
	---------------------------------------------------------------------------
	-- Deallocate the memory of an atom.
	---------------------------------------------------------------------------
	procedure Free(Atom : in out Atom_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Atom_Type,
										   Name => Atom_Ptr);
	begin
		Free(Atom);
		Atom := null;
	end Free;
end Atom;
