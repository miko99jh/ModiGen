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

  // Equations
equation
  // Kirchhoff's voltage law for the loop
  Vb = V + L * der(i_L);

  // Current through the inductor
  i_L = i_R + i_C;

  // Ohm's law for the resistor
  i_R = V / R;

  // Capacitor current equation
  i_C = C * der(V);

  // Initial conditions
  V = 0;
  i_L = 0;
end RLC1;