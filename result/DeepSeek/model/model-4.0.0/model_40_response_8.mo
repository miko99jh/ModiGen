block TransferFunction extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real b[1] = {1} "Numerator coefficients of the transfer function";
  parameter Real a[1] "Denominator coefficients of the transfer function";
  Real x[size(a, 1) - 1] = {0.0} "State vector";
  parameter Integer nb = size(b, 1) "Size of Numerator of transfer function";
  parameter Integer na = size(a, 1) "Size of Denominator of transfer function";
  Real x1 "Intermediate variable for state calculation";
  Real xext[na] "Extended state vector";
equation
  x1 = (u - sum(a[2:na] * previous(x))) / a[1];
  xext = [x1, previous(x)];
  x = xext[2:na];
  y = sum(b * xext);
end TransferFunction;