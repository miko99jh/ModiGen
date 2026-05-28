function moh
 input Real t; // Current time in seconds
  input Real hour_start = 0; // Starting hour
  input Real min_start = 0; // Starting minute
  input Real sec_start = 0; // Starting second
  output Real y; // Minute of the current hour (0 to 59)
protected
  Real s; // Seconds of the day
  Real h; // Hour of the day
algorithm
  // Calculate seconds of the day using AES.Functions.sod
  s := AES.Functions.sod(t, hour_start, min_start, sec_start);
  
  // Calculate hour of the day using AES.Functions.hod
  h := AES.Functions.hod(t, hour_start, min_start, sec_start);
  
  // Calculate the minute of the current hour
  y := floor((s - h * 3600) / 60);
end moh;