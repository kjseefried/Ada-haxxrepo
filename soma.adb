with Ada.Unchecked_Deallocation;

package body Soma is

	function Create_Soma(X, Y, Z : Integer) return Soma_Ptr is
		
	begin
		return new Soma_Type'(X => X,
							  Y => Y,
							  Z => Z);
	end Create_Soma;
	
	
	function Get_X(Soma : in Soma_Ptr) return Integer is
	begin
		return Soma.all.X;
	end Get_X;
	
	
	function Get_Y(Soma : in Soma_Ptr) return Integer is
	begin
		return Soma.all.Y;
	end Get_Y;
	
	
	function Get_Z(Soma : in Soma_Ptr) return Integer is
	begin
		return Soma.all.Z;
	end Get_Z;
	
	
	procedure Free_Soma(Soma : in out Soma_Ptr) is
		procedure Free is
			new Ada.Unchecked_Deallocation(Object => Soma_Type,
										   Name => Soma_Ptr);
	begin
		Free(Soma);
		Soma := null;
	end Free_Soma;
end Soma;
