with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Atom is

	---------------------------------------------------------------------------
	-- Creates an Atom an initialize all coordinates to 0 and sets Next to null.
	---------------------------------------------------------------------------
	function Create_Atom (X, Y, Z : Integer) return Atom_Ptr is
	begin
		return new Atom_Type'(Next => null,
							  Has_Next => False,
							  X => X,
							  Y => Y,
							  Z => Z);
	end Create_Atom;

	---------------------------------------------------------------------------
	-- Copy of an atom
	---------------------------------------------------------------------------
	function Copy (Atom : in Atom_Ptr) return Atom_Ptr is
		Tmp : Atom_Ptr := null;
	begin
		if Has_Next(Atom) then
			Tmp := Copy(Get_Next(Atom));
		end if;

		return new Atom_Type'(Next     => Tmp,
							  Has_Next => Has_Next(Atom),
							  X        => Get_X(Atom),
							  Y        => Get_Y(Atom),
							  Z        => Get_Z(Atom));
	end Copy;


	---------------------------------------------------------------------------
	-- Returns a null Atom_Ptr
	---------------------------------------------------------------------------
	function Get_Atom_Null_Ptr return Atom_Ptr is
		Atom : constant Atom_Ptr := null;
	begin
		return Atom;
	end Get_Atom_Null_Ptr;

	---------------------------------------------------------------------------
	-- Get the X coordinate of an Atom
	---------------------------------------------------------------------------
	function Get_X (Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.X;
	end Get_X;


	---------------------------------------------------------------------------
	-- Get the Y coordinate of an Atom
	---------------------------------------------------------------------------
	function Get_Y (Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.Y;
	end Get_Y;


	---------------------------------------------------------------------------
	-- Get the Z coordinate of an Atom
	---------------------------------------------------------------------------
	function Get_Z (Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.Z;
	end Get_Z;



	---------------------------------------------------------------------------
	-- Set the X coordinate of an Atom
	---------------------------------------------------------------------------
	procedure Set_X (Atom : in Atom_Ptr; X : in Integer) is
	begin
		Atom.all.X := X;
	end Set_X;

	---------------------------------------------------------------------------
	-- Set the Y coordinate of an Atom
	---------------------------------------------------------------------------
	procedure Set_Y (Atom : in Atom_Ptr; Y : in Integer) is
	begin
		Atom.all.Y := Y;
	end Set_Y;

	---------------------------------------------------------------------------
	-- Set the Z coordinate of an Atom
	---------------------------------------------------------------------------
	procedure Set_Z (Atom : in Atom_Ptr; Z : in Integer) is
	begin
		Atom.all.Z := Z;
	end Set_Z;


	---------------------------------------------------------------------------
	-- Get the next Atom in the list.
	---------------------------------------------------------------------------
	function Get_Next (Atom : in Atom_Ptr) return Atom_Ptr is
	begin
		return Atom.all.Next;
	end Get_Next;

	---------------------------------------------------------------------------
	-- Get the next Atom in the list.
	---------------------------------------------------------------------------
	function Has_Next (Atom : in Atom_Ptr) return Boolean is
	begin
		return Atom.all.Has_Next;
	end Has_Next;


	---------------------------------------------------------------------------
	-- Set the the next element of an Atom
	---------------------------------------------------------------------------
	procedure Set_Next (Atom : in Atom_Ptr; Next : in Atom_Ptr) is
	begin
		Atom.all.Has_Next := True;
		Atom.all.Next := Next;
	end Set_Next;

    ---------------------------------------------------------------------------
	-- Put an atom
	---------------------------------------------------------------------------
	procedure Put (Atom : in Atom_Ptr) is
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
	procedure Put_All (Atom : in Atom_Ptr) is
		Temp : Atom_Ptr := Atom;
	begin

		loop
			Put(Temp);
			New_Line;
			if not Has_Next(Temp) then
				return;
			end if;
			Temp := Temp.all.Next;
		end loop;
	end Put_All;

    ---------------------------------------------------------------------------
    -- Deallocate the memory of an atom. Kind of...
    ---------------------------------------------------------------------------
    function "=" (Left,Right : in Atom_Ptr) return Boolean is
    begin
        return Get_X(Left) = Get_X(Right) and then
		  Get_Y(Left) = Get_Y(Right) and then
		  Get_Z(Left) = Get_Z(Right);
	end "=";

    ---------------------------------------------------------------------------
    -- Deallocate the memory of an atom.
    ---------------------------------------------------------------------------
	procedure Free (Atom : in out Atom_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Atom_Type,
										   Name => Atom_Ptr);
	begin
		Free(Atom);
		Atom := null;
	end Free;

   ---------------------------------------------------------------------------
    -- Deallocate the memory of an atom list.
    ---------------------------------------------------------------------------
	procedure Free_List (Atom : in out Atom_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Atom_Type,
										   Name => Atom_Ptr);
		Tmp_Pointer : Atom_Ptr := null;
		Recurse     : Boolean := False;
	begin

		if Has_Next(Atom) then
			Tmp_Pointer := Get_Next(Atom);
			Recurse     := True;
		end if;
		Free(Atom);
		Atom := null;
		if Recurse then
			Free_List(Tmp_Pointer);
		end if;
	end Free_List;

end Atom;
