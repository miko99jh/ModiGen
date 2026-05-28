model RLC
 import ModelicaByExample.ArrayEquations.StateSpace.LTI;

  // Parameters
  parameter Real Vb = 24; // Voltage source in volts
  parameter Real L = 1;   // Inductance in Henry
  parameter Real R = 100; // Resistance in Ohms
  parameter Real C = 0.001; // Capacitance in Farads

  // State-space matrices
  parameter Real A[2, 2] = [-1/(R*C), 1/C; -1/L, 0];
  parameter Real B[2, 1] = [0; 1/L];
  parameter Real C_matrix[2, 2] = [1/R, 0; -1/R, 1];
  parameter Real D[2, 1] = [0; 0];

  // Initial state
  parameter Real x0[2] = {0, 0};

  // State-space component
  LTI rlc_comp(
    nx = 2,
    nu = 1,
    ny = 2,
    A = A,
    B = B,
    C = C_matrix,
    D = D,
    x0 = x0
  );

  // Voltage source
  Modelica.Blocks.Sources.Constant voltageSource(V = Vb);

equation
  // Connect the input 'u' of LTI component to the voltage source
  connect(voltageSource.y, rlc_comp.u[1]);

  // Outputs can be connected to other components or used for analysis
  // connect(rlc_comp.y[1], ...); // Example connection for output 1
  // connect(rlc_comp.y[2], ...); // Example connection for output 2

end RLC;