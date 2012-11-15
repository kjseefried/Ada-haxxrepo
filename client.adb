package body Client is
   
   procedure Create_Socket (Socket : out Socket_Type; Host_Name : in String; Port_Number : in Natural) is      
   begin      
      Connect(Socket, Host_Name, Port_Number);      
   end Create_Socket;
   
   function Create_Message(Header : in Character; boddy : in String) return String is
      Clock_Beat : String(1..8) := "13:37:69";      
   begin
      return To_String(To_Unbounded_String(Clock_Beat & " " & Header & " " & Boddy));
   end Create_Message;
   
   
   procedure Login (Socket : in Socket_Type; Name, Password : in String) is
      Item : String(1..8);
      Last : Integer := 8;
   begin
      Put_Line(Socket,Name);
      Put_Line(Socket,Password);
      Get_line(Socket,Item,last);
      Put(Item(1..last));
   end Login;
   
   procedure Send_Nick(Socket : in Socket_Type; Nick : in String) is
   begin
      Put_line(Socket,Create_Message('N',Nick));
   end Send_Nick;
   
   procedure Skip_Char(Socket : in Socket_Type) is
      Tmp : Character;
   begin
      Get(Socket, Tmp);
   end Skip_Char;
   
   procedure Get_Time(Socket : in Socket_Type; Time : out String) is
   begin
      Get(Socket, Time);
      Skip_Char(Socket);
   end Get_Time;
    
   procedure Get_Header(Socket : in Socket_Type; Header : out Character) is
   begin
      Get(Socket, Header);
      Skip_Char(Socket);
   end Get_Header;
   
   procedure Get_Part_Description(Socket : in Socket_Type; Parts : out Figure_Ptr) is
      No_Parts : Integer;
      Part  : Part_Ptr;
      Time : String(1..8);
      Head : Character;
      
      Atom_Bit : Character;
      X, Y, Z : Integer;
      Tmp_X, Tmp_Y, Tmp_Z : Integer;
   begin
      -- Get number of parts
      Get(Socket, No_Parts);
      
      Parts := Create_Figure;
      
      for L in 1..No_Parts loop
	 Get(Socket, X);
	 Skip_Char(Socket);
	 Get(Socket, Y);
	 Skip_Char(Socket);
	 Get(Socket, Z);
	 Skip_Char(Socket);
	 
	 Tmp_X := 1;
	 Tmp_Y := Y;
	 Tmp_Z := 1;
	 
	 Part := Create_Part;
	 
	 for I in 1..(X*Y*Z) loop
	    Get(Socket, Atom_Bit);
	    
	    if (Atom_Bit = '1') then
	       Insert(Part, Create_Atom(Tmp_X,Tmp_Y,Tmp_Z));
	    end if;
	    
	    Tmp_X := Tmp_X + 1;
	    
	    if (Tmp_X > X) then
	       Tmp_X := 1;
	       Tmp_Y := Tmp_Y - 1;
	    end if;
	    if (I mod (X * Y) = 0) then
	       Tmp_Y := Y;
	       Tmp_Z := Tmp_Z + 1;
	    end if;
	 end loop;
	 
	 Insert(Parts, Part);
      end loop;
   end Get_Part_Description;
    
   procedure Get_Figure_Description(Socket : in Socket_Type; Figure : out Figure_Ptr; Figure_No : out Integer) is
      No_Parts : Integer;
      Part  : Part_Ptr;
      Time : String(1..8);
      Head : Character;
      
      Atom_Bit : Character;
      X, Y, Z : Integer;
      Tmp_X, Tmp_Y, Tmp_Z : Integer;
   begin
      -- Get number of parts
      Get(Socket, Figure_No);
      
      Figure := Create_Figure;
      
      Get(Socket, X);
      Skip_Char(Socket);
      Get(Socket, Y);
      Skip_Char(Socket);
      Get(Socket, Z);
      Skip_Char(Socket);
      
      Tmp_X := 1;
      Tmp_Y := Y;
      Tmp_Z := 1;
      
      Part := Create_Part;
      
      for I in 1..(X*Y*Z) loop
	 Get(Socket, Atom_Bit);
	 
	 if (Atom_Bit = '1') then
	    Insert(Part, Create_Atom(Tmp_X,Tmp_Y,Tmp_Z));
	 end if;
	 
	 Tmp_X := Tmp_X + 1;
	 
	 if (Tmp_X > X) then
	    Tmp_X := 1;
	    Tmp_Y := Tmp_Y - 1;
	 end if;
	 
	 if (I mod (X * Y) = 0) then
	    Tmp_Y := Y;
	    Tmp_Z := Tmp_Z + 1;
	 end if;
	 
      end loop;
      
      Insert(Figure, Part);
      Put(Figure);
   end Get_Figure_Description;  
end Client;      
