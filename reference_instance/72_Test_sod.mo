model Test_sod
  Real y;
equation
  y = AES.Functions.sod(15, 8, 0, 28);
end Test_sod;
