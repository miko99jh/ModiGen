model LimitedActuator "An actuator with lag and saturation"
  extends ModelicaByExample.Architectures.SensorComparison.Interfaces.Actuator;
  parameter Modelica.SIunits.Time delayTime
 "Delay time of output with respect to input signal";
  parameter Real uMax "Upper limits of input signals";
protected
  Modelica.Mechanics.Rotational.Sources.Torque torque(useSupport=true);
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=uMax);
  Modelica.Blocks.Nonlinear.FixedDelay lag(delayTime=delayTime);
equation
  connect(torque.flange, shaft);
  connect(torque.support, housing);
  connect(limiter.y, torque.tau);
  connect(lag.u, tau);
  connect(lag.y, limiter.u);
end LimitedActuator;
