package body Client is
   
   procedure Create_Socket (Socket : out Socket_Type; Host_Name : in String; Port_Number : in Natural) is      
   begin      
      Connect(Socket, Host_Name, Port_Number);      
   end Create_Socket;
   
   function Create_Message(Header : in Character; boddy : in String) return Unbounded_String is
      Clock_Beat : String(1..8) := "13:37:69";      
   begin
      return To_Unbounded_String(Clock_Beat & " " & Header & " " & Boddy);
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
      Put_line(Socket,To_String(Create_Message('N',Nick)));
   end Send_Nick;
   
   
end Client;

      
