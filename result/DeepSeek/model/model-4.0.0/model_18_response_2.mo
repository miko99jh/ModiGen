model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T(start = 0) "Time constant";
  parameter Real k(start = 1) "Gain";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization";
  parameter Real y_start(start = 0) "Initial value of the output";
  parameter Boolean noDynamics = not(T > 0) "Determines trivial configuration with no dynamics";
  Modelica.Blocks.Continuous.FirstOrder firstOrder1 if not noDynamics(k = k, T = T, initType = initType, y_start = y_start);
  Modelica.Blocks.Math.Gain gain if noDynamics(k = k);
  equation
    connect(u, firstOrder1.u) if not noDynamics;
    connect(u, gain.u) if noDynamics;
    connect(firstOrder1.y, y) if not noDynamics;
    connect(gain.y, y) if noDynamics;
end FirstOrder;