package Figure is

    function Create_Figure () return Figure_Ptr;

    function Get_Next (Figure : in Figure_Type) return Integer;

    function Get_Max_X (Figure : in Figure_Type) return Integer;
    function Get_Max_Y (Figure : in Figure_Type) return Integer;
    function Get_Max_Z (Figure : in Figure_Type) return Integer;

    function Get_Size (Figure : in Figure_Type) return Integer;

    procedure Free_Figure (Figure : in out Figure_Type);

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


