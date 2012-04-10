
package Soma is
   type Soma_Ptr is private;

   function Create_Soma(X, Y, Z : Integer) return Soma_Ptr;
   
   function Get_X(Soma : in Soma_Ptr) return Integer;
   function Get_Y(Soma : in Soma_Ptr) return Integer;
   function Get_Z(Soma : in Soma_Ptr) return Integer;
   
   procedure Free_Soma(Soma : in out Soma_Ptr);

private
   type Soma_Ptr is access Soma_Type;
   type Soma_Type is
	  record
		 X : Integer;
		 Y : Integer;
		 Z : Integer;
	  end record;

end Soma;
