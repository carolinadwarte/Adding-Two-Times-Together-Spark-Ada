pragma SPARK_Mode (On);

with AS_IO_Wrapper;  use AS_IO_Wrapper; 
with Clock;  use Clock; 


procedure Main is

   t1, t2, t3 : time;
   input : Integer;
   
  

begin
   -- First we initialise standard_input and standard output
   AS_Init_Standard_Output;
   AS_Init_Standard_Input; 
   loop
      loop
	AS_Put("Enter a number in hour from 0 .. 23: ");   
	AS_Get(input,"Please type in an integer; please try again");
         exit when input in 0 .. 23;
         end loop;
         t1.Hours_Type := input;
         
      loop
	AS_Put("Enter a number in hour from 0 .. 23: ");   
	AS_Get(input,"Please type in an integer; please try again");
         exit when input in 0 .. 23;
      end loop;
      t2.Hours_Type := input;
	
      loop
	AS_Put("Enter a number in minutes from 0 .. 59: ");   
	AS_Get(input,"Please type in an integer; please try again");
         exit when input in 0..59;
      end loop;
      t1.Minutes_Type := input;
              
      loop
	AS_Put("Enter a number in minutes from 0 .. 59: ");   
	AS_Get(input,"Please type in an integer; please try again");
         exit when input in 0..59;
      end loop;
      t2.Minutes_Type := input;
   
      loop
	AS_Put("Enter a number in seconds from 0 .. 59: ");   
	AS_Get(input,"Please type in an integer; please try again");
         exit when input in 0..59;
      end loop;
      t1.Seconds_Type := input;
                     
      loop
	AS_Put("Enter a number in seconds from 0 .. 59: ");   
	AS_Get(input,"Please type in an integer; please try again");
         exit when input in 0..59;
      end loop;
      t2.Seconds_Type := input;
      
      TimesTogether(t1, t2, t3);
     AS_Put("The result of the procedure is ");
     AS_Put(t3.Hours_Type);
     AS_Put(t3.Minutes_Type);
     AS_Put(t3.Seconds_Type);
      
     AS_Put_Line(""); 
     t3 := TimesTogetherFun(t1,t2);
     AS_Put("The result of the function is ");
     AS_Put(t3.Hours_Type);
     AS_Put(t3.Minutes_Type);
     AS_Put(t3.Seconds_Type);
     AS_Put_Line("");
                         
  end loop;        
end Main;
   

