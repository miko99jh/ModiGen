model PID_Controller
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;
  parameter Modelica.SIunits.Time Ti = 1;
  parameter Modelica.SIunits.Time Td = 0.1;
  parameter Real k = 1;
  parameter Real yMax = 100;
  protected 
  Modelica.Blocks.Continuous.LimPID PID;
  equation 
  PID.k = k;
  PID.Ti = Ti;
  PID.Td = Td;
  PID.yMax = yMax;
  PID.u_s = setpoint;
  PID.u_m = measured;
  command = PID.y;
end PID_Controller;