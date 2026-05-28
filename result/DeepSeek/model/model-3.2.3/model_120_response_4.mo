model PID_Controller
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;
  parameter Modelica.SIunits.Time Ti = 1;
  parameter Modelica.SIunits.Time Td = 0.1;
  parameter Real k = 1;
  parameter Real yMax = 100;
protected 
  Modelica.Blocks.Continuous.LimPID PID(k=k, Ti=Ti, Td=Td, yMax=yMax);
equation 
  PID.u_s = setpoint;
  PID.u_m = measured;
  command = PID.y;
end PID_Controller;