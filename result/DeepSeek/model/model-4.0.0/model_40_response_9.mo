block TransferFunction extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real b[1]={1} "Numerator coefficients of the transfer function";
  parameter Real a[1] "Denominator coefficients of the transfer function";
  Real x[size(a, 1)-1] = {0.0} "State vector representing the internal states of the system in controller canonical form";
  Real x1;
  Real xext[size(a, 1)];

protected 
  parameter Integer nb=size(b, 1) "Size of Numerator of transfer function";
  parameter Integer na=size(a, 1) "Size of Denominator of transfer function";

equation 
  // Intermediate State
  x1 = (u - sum(a[2:na] * previous(x))) / a[1];

  // State Composition
  xext = concatenate(1, x1, previous(x));

  // State Update
  x = slice(xext, 1, na-1);

  // Output Calculation
  y = sum(b * xext);
end TransferFunction;