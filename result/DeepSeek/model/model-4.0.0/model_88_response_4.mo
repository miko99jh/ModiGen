model RLC1
  parameter Real R(unit="Ω") = 100;
  parameter Real L(unit="H") = 1;
  parameter Real C(unit="F") = 1e-3;
  parameter Real Vb(unit="V") = 24;
  Real V(start=0);
  Real i_L(start=0);
  Real i_R(start=0);
  Real i_C(start=0);
equation
  // equation for the voltage across the parallel branch (capacitor and resistor)
  V = Vb - i_R*R;
  // equation for the current through the inductor
  i_L = V / L;
  // equation for the current through the resistor
  i_R = V / R;
  // equation for the current through the capacitor
  i_C = C*dV/dt;
end RLC1;