with Ada.Unchecked_Deallocation;

package body Atom is

	function Create_Atom(X, Y, Z : Integer) return Atom_Ptr is		
	begin
		return new Atom_Type'(X => X,
							  Y => Y,
							  Z => Z);
	end Create_Atom;
	
	
	function Get_X(Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.X;
	end Get_X;
	
	
	function Get_Y(Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.Y;
	end Get_Y;
	
	
	function Get_Z(Atom : in Atom_Ptr) return Integer is
	begin
		return Atom.all.Z;
	end Get_Z;
	
	
	function Is_Empty(Atom : in Atom_Ptr) return Boolean is
	begin
		return Atom = null;
	end Is_Empty;
	
	
	procedure Set_X(Atom : in Atom_Ptr; X : in Integer) is
	begin
		Atom.all.X := X;
	end Set_X;
	
	procedure Set_Y(Atom : in Atom_Ptr; Y : in Integer) is	
	begin
		Atom.all.Y := Y;
	end Set_Y;

	procedure Set_Z(Atom : in Atom_Ptr; Z : in Integer) is
	begin
	   Atom.all.Z := Z;
	end Set_Z;
	
	
	procedure Free_Atom(Atom : in out Atom_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Atom_Type,
										   Name => Atom_Ptr);
	begin
		Free(Atom);
		Atom := null;
	end Free_Atom;
end Atom;
