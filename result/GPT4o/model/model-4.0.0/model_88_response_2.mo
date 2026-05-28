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
  voltageSource.p = inductor.p;
  voltageSource.n = resistor.n;

  // Inductor connection
  inductor.n = resistor.p;

  // Parallel connection of resistor and capacitor
  resistor.n = capacitor.n;
  resistor.p = capacitor.p;

  // Equations for currents and voltages
  V = resistor.v; // Voltage across the parallel branch
  i_R = resistor.i; // Current through the resistor
  i_C = capacitor.i; // Current through the capacitor
  i_L = inductor.i; // Current through the inductor

  // Kirchhoff's current law at the parallel branch
  i_R + i_C = inductor.i;
end RLC1;