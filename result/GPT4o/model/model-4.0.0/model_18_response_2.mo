model FirstOrder
 extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));

  parameter Boolean noDynamics = not(T > 0) "Determines trivial configuration with no dynamics";
  parameter Real k = 1 "Gain of the filter";
  parameter Modelica.Units.SI.Time T "Time constant of the filter";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.NoInit "Type of initialization";
  parameter Real y_start = 0 "Initial value of the output";

  Modelica.Blocks.Continuous.FirstOrder firstOrder1(
    T = T, 
    initType = initType, 
    k = k, 
    y_start = y_start) if not noDynamics;

  Modelica.Blocks.Math.Gain gain(k = k) if noDynamics;

equation
  if not noDynamics then
    connect(u, firstOrder1.u);
    connect(firstOrder1.y, y);
  else
    connect(u, gain.u);
    connect(gain.y, y);
  end if;
end FirstOrder;