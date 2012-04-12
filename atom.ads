
package Atom is
   type Atom_Ptr is private;
   type Atom_Type is private;

   function Create_Atom(X, Y, Z : Integer) return Atom_Ptr;

   function Get_X(Atom : in Atom_Ptr) return Integer;
   function Get_Y(Atom : in Atom_Ptr) return Integer;
   function Get_Z(Atom : in Atom_Ptr) return Integer;
   function Get_Next(Atom : in Atom_Ptr) return Atom_Ptr;
   function Has_Next(Atom : in Atom_Ptr) return Boolean;
   function Get_Atom_Null_Ptr return Atom_Ptr;
   
   procedure Set_X(Atom : in Atom_Ptr; X : in Integer);
   procedure Set_Y(Atom : in Atom_Ptr; Y : in Integer);
   procedure Set_Z(Atom : in Atom_Ptr; Z : in Integer);
   procedure Set_Next(Atom : in Atom_Ptr; Next : in Atom_Ptr);

    function "=" (Left,Right : in Atom_Ptr) return Boolean;

   procedure Put(Atom : in Atom_Ptr);
   procedure Put_All(Atom : in Atom_Ptr);

   procedure Free(Atom : in out Atom_Ptr);

private
   type Atom_Ptr is access Atom_Type;
   type Atom_Type is
	  record
		  Next : Atom_Ptr;
		  Has_Next : Boolean;
		  X : Integer;
		  Y : Integer;
		  Z : Integer;
	  end record;

end Atom;
