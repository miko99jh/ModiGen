block TransferFunction extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real b[1:size(b, 1) = 1] = {1};
  parameter Real a[1:size(a, 1)] = {1};
  Real x[size(a, 1) - 1] = {0.0};
  parameter Integer nb = size(b, 1);
  parameter Integer na = size(a, 1);
  Real x1;
  Real xext[na] = {0.0};
equation
  x1 = (u - sum(a[2:na] * previous(x))) / a[1];
  xext = {x1, previous(x)};
  x = xext[2:na];
  y = sum(b * xext);
end TransferFunction;