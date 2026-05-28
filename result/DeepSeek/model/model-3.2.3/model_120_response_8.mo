model PID_Controller
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;
  parameter Modelica.SIunits.Time Ti = 1 "Time constant of Integrator block";
  parameter Modelica.SIunits.Time Td = 0.1 "Time constant of Derivative block";
  parameter Real k = 1 "Gain of controller";
  parameter Real yMax = 100 "Upper limit of output";
protected 
  Modelica.Blocks.Continuous.LimPID PID(k=k, Ti=Ti, Td=Td, yMax=yMax);
equation 
  PID.u_s = setpoint;
  PID.u_m = measuredSignal;
  command = PID.y;
end PID_Controller;