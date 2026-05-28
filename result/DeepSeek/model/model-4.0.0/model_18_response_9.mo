model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T(start = 0);
  parameter Real k(start = 1) = 1;
  parameter Real y(start = 0) = y_start;
  parameter Boolean noDynamics = not(T > 0);
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = T, initType = Modelica.Blocks.Types.Init.NoInit, k = k, y_start = y_start) if not noDynamics;
  Modelica.Blocks.Math.Gain gain(k = k) if noDynamics;
  Modelica.Blocks.Interfaces.RealInput u;
  Modelica.Blocks.Interfaces.RealOutput y;
equation 
  if not noDynamics then
    connect(u, firstOrder1.u);
    connect(firstOrder1.y, y);
  else
    connect(u, gain.u);
    connect(gain.y, y);
  end if;
end FirstOrder;