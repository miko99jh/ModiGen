block TransferFunction
 extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO;

  parameter Real b[:] = {1} "Numerator coefficients of the transfer function";
  parameter Real a[:] "Denominator coefficients of the transfer function";

  output Real x[size(a, 1) - 1] "State vector representing internal states";

protected 
  parameter Integer nb = size(b, 1) "Size of Numerator of transfer function";
  parameter Integer na = size(a, 1) "Size of Denominator of transfer function";
  Real x1 "Intermediate variable used to calculate the current state";
  Real xext[size(a, 1)] "Extended state vector including current and previous states";

equation 
  // Calculate the intermediate state x1
  x1 = (u - sum(a[2:na] .* previous(x))) / a[1];

  // Construct the extended state vector xext
  xext = {x1, previous(x)};

  // Update the state vector x
  x = xext[1:na-1];

  // Compute the output y
  y = sum(b .* xext[1:nb]);
end TransferFunction;