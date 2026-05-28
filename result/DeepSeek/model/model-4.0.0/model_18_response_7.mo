model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T(start = 0);
  parameter Real k(start = 1) = 1;
  parameter Real y(start = 0) = 0;
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.NoInit;
  input Real u;
  output Real y;
  Modelica.Blocks.Continuous.FirstOrder firstOrder1 if not noDynamics(final T = T, final initType = initType, final k = k, final y_start = y_start);
  Modelica.Blocks.Math.Gain gain if noDynamics(final k = k);
equation
  if not noDynamics then
    connect(u, firstOrder1.u);
    connect(firstOrder1.y, y);
  else
    connect(u, gain.u);
    connect(gain.y, y);
  end if;
end FirstOrder;