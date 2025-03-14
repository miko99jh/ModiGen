model Test_magnitude
  parameter Complex u = Complex(re=4, im=3);
  Real y;
equation
  y=AES.Functions.magnitude(u);
end Test_magnitude;
