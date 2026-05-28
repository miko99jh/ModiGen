block TransferFunction extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real b(start={1}) "Numerator coefficients of the transfer function";
  parameter Real a(start={1}) "Denominator coefficients of the transfer function";
  Real x[na-1](start={0.0}) "State vector representing the internal states of the system";
  parameter Integer nb=size(b, 1);
  parameter Integer na=size(a, 1);
  Real x1;
  Real xext[na] = zeros(na);
equation
  x1 = (u - sum(a[2:na] * previous(x))) / a[1];
  xext = [x1, previous(x)];
  x = xext[2:na];
  y = sum(b * xext);
end TransferFunction;