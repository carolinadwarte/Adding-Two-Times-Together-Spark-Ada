pragma SPARK_Mode;


package Clock is
   
   subtype timerange is Integer range 0..59;
   type time is
      record
         Hours_Type : Integer;
         Minutes_Type : timerange;
         Seconds_Type : timerange;
         end record;
 
   
    
   function To12 (T : Integer) return Integer;
    
   procedure To12Proc(T : in Integer; U : out Integer);
   
   function verify (compute : time) return Integer with
     Pre => (compute.Hours_Type in 0 .. 47 and
             compute.Minutes_Type in 0 .. 59 and
             compute.Seconds_Type in 0 ..59),
     Post => (verify'Result = compute.Hours_Type * 3600 + compute.Minutes_Type * 60 + compute.Seconds_Type);
   
   procedure TimesTogether(t1, t2 : in time; t3 : out time) with
     Depends => (t3 => (t1,t2)),
     Pre => (t1.Hours_Type in 0 .. 23 and t2.Hours_Type in 0 .. 23 and
             t1.Minutes_Type in 0 .. 59 and t2.Minutes_Type in 0 .. 59 and
             t1.Seconds_Type in 0 .. 59 and t2.Seconds_Type in 0 .. 59), 
     Post => (verify(t1) + verify(t2) = verify(t3));
   
   function TimesTogetherFun (t1, t2 : in time) return time with
     --Depends => (TimesTogetherFun'Result => (t1,t2)),
     Pre => (t1.Hours_Type in 0 .. 23 and t2.Hours_Type in 0 .. 23 and
             t1.Minutes_Type in 0 .. 59 and t2.Minutes_Type in 0 .. 59 and
             t1.Seconds_Type in 0 .. 59 and t2.Seconds_Type in 0 .. 59), 
     Post => (verify(t1) + verify(t2) = verify(TimesTogetherFun'Result));
     
end Clock;
     
     
   
     
   
