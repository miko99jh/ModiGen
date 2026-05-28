model PID_Controller
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;
  parameter Modelica.SIunits.Time Ti;
  parameter Modelica.SIunits.Time Td;
  parameter Real k;
  parameter Real yMax;
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