function f1p1z1 "Function lead lag process: k(1+sT1)/(1+sT2)"
  input Real alfa "Parametro di discretizzazione";
  input Real T1 "Zero";
  input Real T2 "Polo";
  input Real u "Current input";
  input Real u_pre "Previous input";
  input Real y_pre "Previous output";
  input Real Ts "Sampling time [s]";
  input Real k "Gain";
  output Real y "Output";
protected
  Real A;
  Real B;
  Real C;
  Real D;
  Real E;
  Real F;
algorithm
  A := alfa*Ts;
  B := Ts - alfa*Ts;
  C := A + T1;
  D := B - T1;
  E := A + T2;
  F := B - T2;
  y := (C*k*u + D*k*u_pre - F*y_pre)/E;
end f1p1z1;
