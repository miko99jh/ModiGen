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
  y := mod(s, 3600)/60 + min_start;
  if y >= 60 then
    y := y - 60;
    h := h + 1;
    if h >= 24 then
      h := h - 24;
    end if;
  end if;
end moh;