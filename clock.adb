pragma SPARK_Mode;


package body Clock is
   
   function To12 (T : Integer) return Integer is
   begin
      if T >= 12 then return T - 12;
      else return T;
      end if;
   end To12;
   
   function  verify (compute : time) return Integer is
   begin
      return (compute.Hours_Type * 3600 + compute.Minutes_Type * 60 + compute.Seconds_Type);
   end verify;
 
   
  procedure To12Proc (T : in Integer; U : out Integer) is
  begin
     if T >= 12 then U := T - 12;
     else U := T;
     end if;
   end To12Proc;
   
   procedure TimesTogether (t1, t2 : in time; t3 : out time) is
   begin
      if t1.Seconds_Type +t2.Seconds_Type >= 60 then t3.Minutes_Type:=1;
         t3.Seconds_Type:=t1.Seconds_Type +t2.Seconds_Type-60; 
      else
         t3.Seconds_Type:=t1.Seconds_Type +t2.Seconds_Type;
         t3.Minutes_Type:=0;
      end if;
      if t1.Minutes_Type+t2.Minutes_Type + t3.Minutes_Type >=60 then t3.Hours_Type:=1;
         t3.Minutes_Type:=t1.Minutes_Type+t2.Minutes_Type + t3.Minutes_Type -60;
      else
         t3.Minutes_Type:=t1.Minutes_Type+t2.Minutes_Type + t3.Minutes_Type;
         t3.Hours_Type:=0;
      end if;
      t3.Hours_Type:=t1.Hours_Type+t1.Hours_Type + t3.Hours_Type;
   end TimesTogether;     
   
   function TimesTogetherFun (t1, t2 : in time) return time is
      t3 : time;
   begin
      if t1.Seconds_Type +t2.Seconds_Type >= 60 then t3.Minutes_Type:=1;
         t3.Seconds_Type:=t1.Seconds_Type +t2.Seconds_Type-60; 
      else
         t3.Seconds_Type:=t1.Seconds_Type +t2.Seconds_Type;
         t3.Minutes_Type:=0;
      end if;
      if t1.Minutes_Type+t2.Minutes_Type + t3.Minutes_Type >=60 then t3.Hours_Type:=1;
         t3.Minutes_Type:=t1.Minutes_Type+t2.Minutes_Type + t3.Minutes_Type -60;
      else
         t3.Minutes_Type:=t1.Minutes_Type+t2.Minutes_Type + t3.Minutes_Type;
         t3.Hours_Type:=0;
      end if;
      t3.Hours_Type:=t1.Hours_Type+t1.Hours_Type + t3.Hours_Type;
      return t3;
   end TimesTogetherFun;    
     
     
end Clock;
     
     
   
     
   
