block TransferFunction "Discrete-time Transfer Function block"
  extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO;
  parameter Real b[:]={1} "Numerator coefficients of transfer function.";
  parameter Real a[:] "Denominator coefficients of transfer function.";

  output Real x[size(a, 1) - 1](each start=0.0)
    "State vector of controller canonical form";
protected
  parameter Integer nb=size(b, 1) "Size of Numerator of transfer function";
  parameter Integer na=size(a, 1)
    "Size of Denominator of transfer function";
  Real x1;
  Real xext[size(a, 1)];

equation
  when Clock() then
    /* State variables x are defined according to
       controller canonical form. */
    x1 = (u - a[2:size(a, 1)]*previous(x))/a[1];
    xext = vector([x1; previous(x)]);
    x = xext[1:size(x, 1)];
    y = vector([zeros(na - nb, 1); b])*xext;
  end when;
end TransferFunction;
