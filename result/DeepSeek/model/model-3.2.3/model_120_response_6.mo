model PID_Controller
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;
  parameter Modelica.SIunits.Time Ti(start=1);
  parameter Modelica.SIunits.Time Td(start=0.1);
  parameter Real k(start=1);
  parameter Real yMax(start=100);
  protected 
  Modelica.Blocks.Continuous.LimPID PID;
  equation 
  PID.k = k;
  PID.Ti = Ti;
  PID.Td = Td;
  PID.yMax = yMax;
  PID.u_s = reference;
  PID.u_m = measured;
  command = PID.y;
end PID_Controller;