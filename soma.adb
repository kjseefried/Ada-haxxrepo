with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;
with TJa.Sockets; use TJa.Sockets;

with Client; use Client;

procedure Soma is
   
   Socket : Socket_Type;   
   Username : String(1..8) := "username";
   Password : String(1..8) := "password";
   
begin
   
   Initiate(socket);
   
   Create_Socket(Socket, "localhost", 1337); 
   
   Login(Socket, username, Password);
   
   Send_Nick(Socket, "nicket");   
end Soma;
