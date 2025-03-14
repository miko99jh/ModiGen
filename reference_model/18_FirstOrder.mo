model FirstOrder1
  extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
  parameter Boolean noDynamics = not(T > 0) "Trivial configuration with no dynamics G(s) = k";
  parameter Real k=1 "Gain";
  parameter Modelica.Units.SI.Time T = 1 "Time Constant";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3/4: initial output)";
  parameter Real y_start=0 "Initial or guess value of output (= state)";


  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = T, initType = initType, k = k, y_start = y_start)  if not noDynamics;
  Modelica.Blocks.Math.Gain gain(k = k)  if noDynamics;
equation
  connect(gain.y, y);
  connect(firstOrder1.y, y);
  connect(u, firstOrder1.u);
  connect(u, gain.u);    
end FirstOrder1;
