model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Modelica.SIunits.Time T(start=0) "Time constant";
  parameter Real k(start=1) "Gain";
  parameter Real y(start=0) "Output";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.NoInit "Type of initialization";
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=T, initType=initType, k=k, y_start=y) if not noDynamics;
  Modelica.Blocks.Math.Gain gain(k=k) if noDynamics;
equation 
  if not noDynamics then
    connect(u, firstOrder1.u);
    connect(firstOrder1.y, y);
  else
    connect(u, gain.u);
    connect(gain.y, y);
  end if;
end FirstOrder;