model PID_Controller
 extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;

  // Parameters for the PID controller
  parameter Real k = 1 "Gain of controller";
  parameter Modelica.SIunits.Time Ti = 1 "Time constant of Integrator block";
  parameter Modelica.SIunits.Time Td = 0 "Time constant of Derivative block";
  parameter Real yMax = 10 "Upper limit of output";

protected 
  // PID block from Modelica library
  Modelica.Blocks.Continuous.LimPID PID(
    k = k,
    Ti = Ti,
    Td = Td,
    yMax = yMax
  );

equation
  // Connect external setpoint to PID setpoint input
  PID.u_s = setpoint;

  // Connect measured signal to PID measurement input
  PID.u_m = measurement;

  // Connect PID output to external command interface
  command = PID.y;

end PID_Controller;