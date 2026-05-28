function f1p1z
 input Real alfa "Discretization parameter";
  input Real T1 "Zero of the transfer function";
  input Real T2 "Pole of the transfer function";
  input Real u "Current input";
  input Real u_pre "Previous input";
  input Real y_pre "Previous output";
  input Real Ts "Sampling time in seconds";
  input Real k "Gain of the transfer function";
  output Real y "Output of the function";

protected
  Real A "Intermediate variable A";
  Real B "Intermediate variable B";
  Real C "Intermediate variable C";
  Real D "Intermediate variable D";
  Real E "Intermediate variable E";
  Real F "Intermediate variable F";

algorithm
  // Calculate intermediate variables
  A := alfa * Ts;
  B := Ts - alfa * Ts;
  C := A + T1;
  D := B - T1;
  E := A + T2;
  F := B - T2;

  // Compute the output
  y := (C * k * u + D * k * u_pre - F * y_pre) / E;
end f1p1z;