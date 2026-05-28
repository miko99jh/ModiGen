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
  // Calculate seconds of the day
  s := AES.Functions.sod(hour_start, min_start, sec_start) + t;
  
  // Calculate hour of the day
  h := AES.Functions.hod(s);
  
  // Calculate minute of the current hour
  y := floor(mod(s, 3600) / 60);
end moh;