with Atom; use Atom;

package Part is

    type Part_Ptr is private;
    type Part_Type is private;

    function Create_Part return Part_Ptr;
    function Get_Data (Part : in Part_Ptr)return Atom_Ptr;

    function Is_Null (Part : in Part_Ptr) return Boolean;
	function Is_Empty (Part : in Part_Ptr) return Boolean;
    function Get_Size (Part : in Part_Ptr) return Integer;
    function Get_Next (Part : in Part_Ptr) return Part_Ptr;
    function Has_Next (Part : in Part_Ptr) return Boolean;

	function Get_Max_X (Part : in Part_Ptr) return Integer;
    function Get_Max_Y (Part : in Part_Ptr) return Integer;
	function Get_Max_Z (Part : in Part_Ptr) return Integer;
    function Get_Min_X (Part : in Part_Ptr) return Integer;
    function Get_Min_Y (Part : in Part_Ptr) return Integer;
	function Get_Min_Z (Part : in Part_Ptr) return Integer;

	procedure Set_Max_X (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Max_Y (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Max_Z (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Min_X (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Min_Y (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Min_Z (Part : in Part_Ptr; Val : in Integer);


	procedure Set_Size (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Next (Part : in Part_Ptr; Next : in Part_Ptr);
	procedure Set_Data (Part : in Part_Ptr; Atom : in Atom_Ptr);

    procedure Insert (Part : in out Part_Ptr; Atom : in Atom_Ptr);
    function Contains (Part : in Part_Ptr; Atom : in Atom_Ptr) return Boolean;

    procedure Rotate_Z (Part : in Part_Ptr);
    procedure Rotate_X (Part : in Part_Ptr);
    procedure Rotate_Y (Part : in Part_Ptr);

	procedure Move_X (Part : in Part_Ptr; Value : in Integer);
	procedure Move_Y (Part : in Part_Ptr; Value : in Integer);
	procedure Move_Z (Part : in Part_Ptr; Value : in Integer);

    procedure Put (Part : in Part_Ptr);
	procedure Put_All (Part : in Part_Ptr);

    procedure Free (Part : in out Part_Ptr);

private
    type Part_Ptr is access Part_Type;
    type Part_Type is
       record
               Data : Atom_Ptr;
		   Size  : Integer;
                Min_X : Integer;
		   Max_X : Integer;
                Min_Y : Integer;
		   Max_Y : Integer;
                Min_Z : Integer;
		   Max_Z : Integer;
		   Next  : Part_Ptr;
               --Possibilities : Part_Ptr;
               --Pos_Cntr : Integer;
               --Rotate_Cntr : Integer;
       end record;

end Part;


