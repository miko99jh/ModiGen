model FirstOrder
 extends IndustrialControlSystems.LinearSystems.Interfaces.BaseBlock;

  // Parameters
  parameter Real tau = 2 "Time constant";
  parameter Real mu = 1 "Gain";
  parameter Real y_start = 0 "Initial output value";

  // Variables
  Real y "Output";
  Real u "Input";

initial equation
  // Initial condition for the output
  y = y_start;

equation
  // First order process dynamics
  tau * der(y) + y = mu * u;

end FirstOrder;