model Test_angle1
  Complex u(re=4, im=3);
  Modelica.Units.SI.Angle y;
equation
  y = AES.Functions.angle(u);
end Test_angle1;
