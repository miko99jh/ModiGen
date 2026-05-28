model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T(start = 0);
  parameter Real k(start = 1) = 1;
  parameter Real y(start = 0) = 0;
  parameter Boolean noDynamics = not(T > 0);
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(
    T = T,
    initType = Modelica.Blocks.Types.Init.NoInit,
    k = k,
    y_start = y_start
  ) if not noDynamics;
  Modelica.Blocks.Math.Gain gain(k = k) if noDynamics;
  Modelica.Blocks.Interfaces.RealInput u;
  Modelica.Blocks.Interfaces.RealOutput y;
equation 
  connect(u, firstOrder1.u) if not noDynamics;
  connect(u, gain.u) if noDynamics;
  connect(firstOrder1.y, y) if not noDynamics;
  connect(gain.y, y) if noDynamics;
end FirstOrder;