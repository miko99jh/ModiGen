model LimitedActuator
 extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Actuator;

  parameter Modelica.SIunits.Time delayTime = 0.1 "Delay time of the output with respect to the input signal";
  parameter Real uMax = 10 "Upper limit of input signals";

protected 
  Modelica.Mechanics.Rotational.Sources.Torque torque(useSupport=true);
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=uMax);
  Modelica.Blocks.Nonlinear.FixedDelay lag(delayTime=delayTime);

equation 
  // Mechanical Output
  connect(torque.flange, shaft);
  connect(torque.support, housing);

  // Signal Chain
  connect(tau, lag.u);
  connect(lag.y, limiter.u);

  // Actuation
  connect(limiter.y, torque.tau);

end LimitedActuator;