model PID_Controller
 extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;

  parameter Real k = 1 "Gain of controller";
  parameter Modelica.SIunits.Time Ti = 1 "Time constant of Integrator block";
  parameter Modelica.SIunits.Time Td = 0 "Time constant of Derivative block";
  parameter Real yMax = 10 "Upper limit of output";

protected 
  Modelica.Blocks.Continuous.LimPID PID(
    k = k,
    Ti = Ti,
    Td = Td,
    yMax = yMax
  );

equation
  // Connect the external setpoint to the PID block's setpoint input
  PID.u_s = setpoint;

  // Connect the measured signal to the PID block's measurement input
  PID.u_m = measurement;

  // Route the control action from the PID block's output to the external command interface
  command = PID.y;
end PID_Controller;