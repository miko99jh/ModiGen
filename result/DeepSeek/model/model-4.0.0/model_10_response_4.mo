function f1p1z
  input Real alfa;
  input Real T1;
  input Real T2;
  input Real u;
  input Real u_pre;
  input Real y_pre;
  input Real Ts;
  input Real k;
  output Real y;
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
end f1p1z;