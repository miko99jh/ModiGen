model PID_Controller
 extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Controller;

  // Parameters
  parameter Real k = 1 "Gain of controller";
  parameter Modelica.SIunits.Time Ti = 1 "Time constant of Integrator block";
  parameter Modelica.SIunits.Time Td = 0 "Time constant of Derivative block";
  parameter Real yMax = 10 "Upper limit of output";

protected 
  // PID block
  Modelica.Blocks.Continuous.LimPID PID(
    k = k,
    Ti = Ti,
    Td = Td,
    yMax = yMax
  );

equation 
  // Connect the setpoint to the PID block's setpoint input
  connect(setpoint, PID.u_s);

  // Connect the measured signal to the PID block's measurement input
  connect(measurement, PID.u_m);

  // Connect the PID block's output to the command interface
  connect(PID.y, command);

end PID_Controller;