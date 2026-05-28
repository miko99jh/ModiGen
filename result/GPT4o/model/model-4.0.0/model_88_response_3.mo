model RLC1
 // Parameters
  parameter Real R = 100;       // Resistance in ohms
  parameter Real C = 1e-3;      // Capacitance in farads
  parameter Real L = 1;         // Inductance in henrys
  parameter Real Vb = 24;       // Supply voltage in volts

  // Variables
  Real V;                       // Voltage across the parallel branch
  Real i_L;                     // Current through the inductor
  Real i_R;                     // Current through the resistor
  Real i_C;                     // Current through the capacitor

  // Components
  Resistor R1(R=R);
  Capacitor C1(C=C);
  Inductor L1(L=L);
  VoltageSource Vsource(V=Vb);

equation
  // Connect the components
  connect(Vsource.p, R1.p);
  connect(R1.n, C1.p);
  connect(C1.n, Vsource.n);
  connect(R1.n, L1.p);
  connect(L1.n, Vsource.n);

  // Define the variables
  V = R1.v;                     // Voltage across the parallel branch
  i_R = R1.i;                   // Current through the resistor
  i_C = C1.i;                   // Current through the capacitor
  i_L = L1.i;                   // Current through the inductor

  // Kirchhoff's current law at the node between R, C, and L
  i_R + i_C = i_L;

end RLC1;