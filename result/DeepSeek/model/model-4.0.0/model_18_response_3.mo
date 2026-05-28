model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T(start = 1);
  parameter Real k(start = 1) = 1;
  parameter Real y(start = 0) = 0;
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.NoInit;
  parameter Boolean noDynamics = not(T > 0);
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = T, initType = initType, k = k, y_start = y_start) if not noDynamics;
  Modelica.Blocks.Math.Gain gain(k = k) if noDynamics;
  Modelica.Blocks.Interfaces.RealInput u;
  Modelica.Blocks.Interfaces.RealOutput y;
equation 
  if not noDynamics then
    u = firstOrder1.u;
    y = firstOrder1.y;
  else
    u = gain.u;
    y = gain.y;
  end if;
end FirstOrder;