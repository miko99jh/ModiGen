block TransferFunction extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real b(start={1}) "Numerator coefficients of the transfer function";
  parameter Real a(start={1}) "Denominator coefficients of the transfer function";
  Real x[size(a, 1)-1] init=0.0 "State vector";
  parameter Integer nb=size(b, 1);
  parameter Integer na=size(a, 1);
  Real x1;
  Real xext[na] init=zeros(na);
equations 
  x1 = (u - a[2:end]*previous(x))/a[1];
  xext = [x1, previous(x)];
  x = xext[2:na];
  y = b*xext;
end TransferFunction;