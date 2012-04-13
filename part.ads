with Atom; use Atom;

package Part is

    type Part_Ptr is private;
    type Part_Type is private;

    function Create_Part return Part_Ptr;
	function Copy (Part : in Part_Ptr) return Part_Ptr;
    function Get_Data (Part : in Part_Ptr)return Atom_Ptr;

    function Is_Null (Part : in Part_Ptr) return Boolean;
	function Is_Empty (Part : in Part_Ptr) return Boolean;
    function Get_Size (Part : in Part_Ptr) return Integer;
    function Get_Next (Part : in Part_Ptr) return Part_Ptr;
    function Has_Next (Part : in Part_Ptr) return Boolean;

	function Get_Rot_X (Part : in Part_Ptr) return Integer;
    function Get_Rot_Y (Part : in Part_Ptr) return Integer;
	function Get_Rot_Z (Part : in Part_Ptr) return Integer;
	function Get_Rot_Cntr (Part : in Part_Ptr) return Integer;

	function Get_Move_X (Part : in Part_Ptr) return Integer;
    function Get_Move_Y (Part : in Part_Ptr) return Integer;
	function Get_Move_Z (Part : in Part_Ptr) return Integer;

	function Get_Poss_List (Part : in Part_Ptr) return Part_Ptr;

	function Contains (Part : in Part_Ptr; Atom : in Atom_Ptr) return Boolean;
	function Exclude_Part(List : in Part_Ptr; Part : in Part_Ptr)
						 return Part_Ptr;

	function Step_Forward (Part : in Part_Ptr) return Boolean;

	procedure Set_Rot_X (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Rot_Y (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Rot_Z (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Rot_Cntr (Part : in Part_Ptr; Val : in Integer);

	procedure Set_Move_X (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Move_Y (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Move_Z (Part : in Part_Ptr; Val : in Integer);

	procedure Set_Size (Part : in Part_Ptr; Val : in Integer);
	procedure Set_Next (Part : in Part_Ptr; Next : in Part_Ptr);
	procedure Set_Data (Part : in Part_Ptr; Atom : in Atom_Ptr);
	procedure Set_Poss_List(Part : in Part_Ptr; Poss : in Part_Ptr);
    procedure Insert (Part : in out Part_Ptr; Atom : in Atom_Ptr);

    procedure Rotate_Z (Part : in Part_Ptr);
    procedure Rotate_X (Part : in Part_Ptr);
    procedure Rotate_Y (Part : in Part_Ptr);
    procedure Reverse_Rotations (Part : in Part_Ptr)

	procedure Move_X (Part : in Part_Ptr; Value : in Integer);
	procedure Move_Y (Part : in Part_Ptr; Value : in Integer);
	procedure Move_Z (Part : in Part_Ptr; Value : in Integer);

    procedure Put (Part : in Part_Ptr);
	procedure Put_All (Part : in Part_Ptr);

    procedure Free (Part : in out Part_Ptr);
	procedure Free_All (Part : in out Part_Ptr);

private
    type Part_Ptr is access Part_Type;
    type Part_Type is
       record
		   Data : Atom_Ptr;
		   Size  : Integer;
		   Next  : Part_Ptr := null;
		   Rot_X : Integer;
		   Rot_Y : Integer;
		   Rot_Z : Integer;
		   Rot_Cntr : Integer;
		   Move_X : Integer;
		   Move_Y : Integer;
		   Move_Z : Integer;
		   Poss_List : Part_Ptr := null;
		   Poss_Cntr : Integer;
       end record;

end Part;


