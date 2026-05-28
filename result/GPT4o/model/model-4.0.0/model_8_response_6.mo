model FirstOrder
 extends IndustrialControlSystems.LinearSystems.Interfaces.BaseBlock;

  // Parameters
  parameter Real tau = 2 "Time constant of the first-order process";
  parameter Real mu = 1 "Gain of the first-order process";
  parameter Real y_start = 0 "Initial value of the output";

  // Variables
  Real y(start = y_start) "Output of the first-order process";

initial equation
  // Initial condition for the output
  y = y_start;

equation
  // Dynamic behavior of the first-order process
  tau * der(y) + y = mu * u;

end FirstOrder;