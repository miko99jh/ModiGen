model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T(start = 0);
  parameter Real k(start = 1) = 1;
  parameter Real y_start(start = 0) = 0;
  parameter Boolean noDynamics = not(T > 0) = false;
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = T, initType = Modelica.Blocks.Types.Init.NoInit, k = k, y_start = y_start);
  Modelica.Blocks.Math.Gain gain(k = k);
equation 
  if not noDynamics then
    connect(u, firstOrder1.u);
    connect(firstOrder1.y, y);
  else
    connect(u, gain.u);
    connect(gain.y, y);
  end if;
end FirstOrder;