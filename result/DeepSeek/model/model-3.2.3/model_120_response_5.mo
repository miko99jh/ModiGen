model PID_Controller
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;
  parameter Modelica.SIunits.Time Ti;
  parameter Modelica.SIunits.Time Td;
  parameter Real k;
  parameter Real yMax;
  Modelica.Blocks.Continuous.LimPID PID(k=k, Ti=Ti, Td=Td, yMax=yMax);
equation 
  PID.u_s = setpoint;
  PID.u_m = measured;
  command = PID.y;
end PID_Controller;