model Example
 Real t = 100; // time in seconds
  Real hour_start = 10; // initial hour
  Real min_start = 30; // initial minute
  Real sec_start = 0; // initial second
  Real minute; // minute of the hour
equation 
  minute = moh(t, hour_start, min_start, sec_start);
end Example;