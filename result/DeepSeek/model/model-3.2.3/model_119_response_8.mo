model LimitedActuator
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Actuator;
  parameter Modelica.SIunits.Time delayTime "Delay time";
  parameter Real uMax "Upper limit of input signals";
protected 
  Modelica.Mechanics.Rotational.Sources.Torque torque;
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=uMax);
  Modelica.Blocks.Nonlinear.FixedDelay lag(delayTime=delayTime);
equation 
  connect(torque.flange, shaft);
  connect(torque.support, housing);
  connect(tau, lag.u);
  connect(lag.y, limiter.u);
  connect(limiter.y, torque.tau);
end LimitedActuator;