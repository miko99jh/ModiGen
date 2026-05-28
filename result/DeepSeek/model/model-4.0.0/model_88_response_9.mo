model RLC1
  parameter Real R(unit="Ω") = 100;
  parameter Real L(unit="H") = 1;
  parameter Real C(unit="F") = 1e-3;
  parameter Real Vb(unit="V") = 24;
  Real V(start=0, unit="V");
  Real i_L(start=0, unit="A");
  Real i_R(start=0, unit="A");
  Real i_C(start=0, unit="A");
equation 
  // Add your equations here
end RLC1;