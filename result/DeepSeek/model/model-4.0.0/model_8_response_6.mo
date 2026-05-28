model FirstOrder
  extends IndustrialControlSystems.LinearSystems.Interfaces.BaseBlock;
  parameter Real tau=2 "Time constant";
  parameter Real mu=1 "Gain";
  parameter Real y_start=0 "Initial output";
  Real y(start=y_start) "Output";
equation
  der(y) = tau * (u - y) / mu;
end FirstOrder;