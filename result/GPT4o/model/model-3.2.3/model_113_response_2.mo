model RLC
 import ModelicaByExample.ArrayEquations.StateSpace.LTI;

  // Parameters for the RLC circuit
  parameter Real Vb = 24; // Voltage source in volts
  parameter Real L = 1;   // Inductance in Henry
  parameter Real R = 100; // Resistance in ohms
  parameter Real C = 0.001; // Capacitance in Farads

  // State space matrices
  parameter Real A[2, 2] = [-1/(R*C), 1/C; -1/L, 0];
  parameter Real B[2, 1] = [0; 1/L];
  parameter Real Cmat[2, 2] = [1/R, 0; -1/R, 1];
  parameter Real D[2, 1] = [0; 0];

  // Initial state
  parameter Real x0[2] = {0, 0};

  // State space component
  LTI rlc_comp(
    nx=2, 
    nu=1, 
    ny=2, 
    A=A, 
    B=B, 
    C=Cmat, 
    D=D, 
    x0=x0
  );

  // Connect the input 'u' of LTI component to the voltage source
  equation
    rlc_comp.u = Vb;
end RLC;