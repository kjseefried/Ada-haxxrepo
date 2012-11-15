with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;             use Ada.Strings.Unbounded;
with TJa.Sockets; use TJa.Sockets;

with Figure; use Figure;
with Client; use Client;
with Solver; use Solver;

procedure Soma is
   
   Socket : Socket_Type;   
   Username : String(1..8) := "username";
   Password : String(1..8) := "password";
   
   Figure : Figure_Ptr;
   Figure_No : Integer;
   
   Parts : Figure_Ptr;
   
   
   Head : Character;
   Time : String(1..8);
begin
   
   Initiate(socket);
   
   Create_Socket(Socket, "localhost", 1337); 
   
   Login(Socket, username, Password);
   
   Send_Nick(Socket, "nicket");   
   
   loop
      Get_Time(Socket, Time);
      Get_Header(Socket, Head);
      
      case Head is
	 when 'D' =>
	    Get_Part_Description(Socket, Parts);
	 when 'F' =>
	    Get_Figure_Description(Socket, Figure, Figure_No);
	    if (Solve(Figure, Parts)) then
	       Put_Line("GICK!");
	    else
	       Put_Line("FUCK");
	    end if;
	    exit;
	 when others =>
	    New_Line;
	    Put_Line("Fuck! The header was fucking wrong! NOOOOOOO =(");
	    Put("It was: "); Put(Head);
	    New_Line;
	    exit;
      end case;
   end loop;
   
   
end Soma;
