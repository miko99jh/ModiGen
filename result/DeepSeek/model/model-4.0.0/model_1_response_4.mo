model Test_moh
  Real t=100;
  Real hour_start=0;
  Real min_start=0;
  Real sec_start=0;
  Real y;
initial equation 
  y = moh(t, hour_start, min_start, sec_start);
equation 
  assert(y == 1, "Test failed");
end Test_moh;