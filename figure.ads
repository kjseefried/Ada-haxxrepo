package Figure is


	type Figure_Ptr is private;
	type Figure_Type is private;
	
    function Create_Figure return Figure_Ptr;

    function Get_Next (Figure : in Figure_Ptr) return Figure_Ptr;

    function Get_Max_X (Figure : in Figure_Ptr) return Integer;
    function Get_Max_Y (Figure : in Figure_Ptr) return Integer;
    function Get_Max_Z (Figure : in Figure_Ptr) return Integer;

    function Get_Size (Figure : in Figure_Ptr) return Integer;

    procedure Free_Figure (Figure : in out Figure_Ptr);

private
    type Figure_Ptr is access Figure_Type;
    type Figure_Type is
       record
          Next  : Figure_Ptr;
          Size  : Integer;
          Max_X : Integer;
          Max_Y : Integer;
          Max_Z : Integer;
       end record;

end Figure;


