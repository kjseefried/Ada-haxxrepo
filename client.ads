with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;
with TJa.Sockets; use TJa.Sockets;

package Client is
   
   procedure Create_Socket
     (Socket : out Socket_Type; Host_Name : in String; Port_Number : in Natural);
   
   function Create_Message
     (Header : in Character; boddy : in String) return Unbounded_string;
   
   procedure Login 
     (Socket : in Socket_Type; Name, Password : in String);
   
   procedure Send_Nick(Socket : in Socket_Type; Nick : in String);
   
end Client;
  
