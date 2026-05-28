model RLC1
 // Parameters
  parameter Real R = 100; // Resistance in ohms
  parameter Real C = 1e-3; // Capacitance in farads
  parameter Real L = 1; // Inductance in henry
  parameter Real Vb = 24; // Supply voltage in volts

  // Variables
  Real V; // Voltage across the parallel branch
  Real i_L; // Current through the inductor
  Real i_R; // Current through the resistor
  Real i_C; // Current through the capacitor

  // Components
  Resistor resistor(R);
  Capacitor capacitor(C);
  Inductor inductor(L);
  VoltageSource voltageSource(Vb);

equation
  // Voltage source connection
  connect(voltageSource.p, inductor.p);
  connect(inductor.n, capacitor.p);
  connect(inductor.n, resistor.p);

  // Parallel connection of resistor and capacitor
  connect(capacitor.n, resistor.n);

  // Define the variables
  V = capacitor.v; // Voltage across the parallel branch
  i_L = inductor.i; // Current through the inductor
  i_R = resistor.i; // Current through the resistor
  i_C = capacitor.i; // Current through the capacitor

  // Ground connection
  connect(voltageSource.n, capacitor.n);

end RLC1;