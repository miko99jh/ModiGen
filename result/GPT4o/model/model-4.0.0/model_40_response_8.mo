block TransferFunction
 extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO;

  // Parameters
  parameter Real b[:] = {1} "Numerator coefficients of the transfer function";
  parameter Real a[:] "Denominator coefficients of the transfer function";

  // Outputs
  output Real x[size(a, 1) - 1](start = zeros(size(a, 1) - 1)) 
    "State vector representing internal states in controller canonical form";

protected
  parameter Integer nb = size(b, 1) "Size of numerator of transfer function";
  parameter Integer na = size(a, 1) "Size of denominator of transfer function";
  Real x1 "Intermediate variable for current state calculation";
  Real xext[na] "Extended state vector including current and previous states";

equation
  // Ensure denominator's first coefficient is non-zero
  assert(a[1] <> 0, "The first coefficient of the denominator (a[1]) must be non-zero.");

  // Intermediate state calculation
  x1 = (u - sum(a[2:na] .* previous(x))) / a[1];

  // Construct extended state vector
  xext = {x1, previous(x)};

  // Update state vector
  x = xext[1:(na - 1)];

  // Output calculation
  y = sum(b .* {xext[i] for i in 1:nb}) + sum(zeros(na - nb));
end TransferFunction;