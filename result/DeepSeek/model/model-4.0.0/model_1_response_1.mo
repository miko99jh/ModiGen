model TestModel
  parameter Real t = 120; // time in seconds
  parameter Real hour_start = 10;
  parameter Real min_start = 30;
  parameter Real sec_start = 0;
  Real minute;
algorithm 
  minute := moh(t, hour_start, min_start, sec_start);
end TestModel;