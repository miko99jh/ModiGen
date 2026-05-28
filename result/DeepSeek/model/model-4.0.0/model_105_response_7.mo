model VanDerPol
  parameter Real lambda = 0.3 "Van der Pol parameter";
  Real x(start=1) "Oscillator position";
  Real y(start=1) "Velocity of the oscillator";
equation
  der(x) = y;
  der(y) = (1 - lambda*x^2)*y - x;
end VanDerPol;