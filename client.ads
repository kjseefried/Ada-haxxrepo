with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;
with TJa.Sockets; use TJa.Sockets;
with Figure; use Figure;
with Part; use Part;
with Atom; use Atom;

package Client is
   
   procedure Create_Socket
     (Socket : out Socket_Type; Host_Name : in String; Port_Number : in Natural);
   
   function Create_Message
     (Header : in Character; boddy : in String) return String;
   
   procedure Login 
     (Socket : in Socket_Type; Name, Password : in String);
   
   procedure Send_Nick(Socket : in Socket_Type; Nick : in String);
   procedure Get_Part_Description(Socket : in Socket_Type; Parts : out Figure_Ptr);
    procedure Get_Figure_Description(Socket : in Socket_Type; Figure : out Figure_Ptr; Figure_No : out Integer);
   procedure Skip_Char(Socket : in Socket_Type);
   procedure Get_Time(Socket : in Socket_Type; Time : out String);
   procedure Get_Header(Socket : in Socket_Type; Header : out Character);
end Client;
  
