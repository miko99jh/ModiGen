function moh
  input Real t;
  input Real hour_start=0;
  input Real min_start=0;
  input Real sec_start=0;
  output Real y;
algorithm 
  Real s, h;
  s := AES.Functions.sod(t, hour_start, min_start, sec_start);
  h := AES.Functions.hod(t, hour_start, min_start, sec_start);
  y := floor((s + (min_start * 60 + sec_start)) / 60);
end moh;