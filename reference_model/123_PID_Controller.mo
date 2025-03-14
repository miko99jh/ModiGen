model PID_Controller1 "Controller subsystem implemented using a PID controller"
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;
  parameter Real k=1 "Gain of controller";
  parameter Modelica.SIunits.Time Ti=1 "Time constant of Integrator block";
  parameter Modelica.SIunits.Time Td=1 "Time constant of Derivative block";
  parameter Real yMax=1 "Upper limit of output";
protected
  Modelica.Blocks.Continuous.LimPID PID(k=k, Ti=Ti, Td=Td, yMax=yMax);
equation
  connect(setpoint, PID.u_s);
  connect(measured, PID.u_m);
  connect(PID.y, command);
end PID_Controller1;
