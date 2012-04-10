package Part is


	type Part_Ptr is private;
	type Part_Type is private;

    function Create_Part return Part_Ptr;

    function Get_Max_X (Part : in Part_Ptr) return Integer;
    function Get_Max_Y (Part : in Part_Ptr) return Integer;
    function Get_Max_Z (Part : in Part_Ptr) return Integer;

    function Get_Size (Part : in Part_Ptr) return Integer;

    procedure Free_Part (Part : in out Part_Ptr);

private
    type Part_Ptr is access Part_Type;
    type Part_Type is
       record
          Size  : Integer;
          Max_X : Integer;
          Max_Y : Integer;
          Max_Z : Integer;
       end record;

end Part;


