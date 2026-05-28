model PIDController
 parameter Real Kp=1;
  parameter Real Ki=0.2;
  parameter Real Kd=0.1;
  parameter Real target_height=1;
  parameter Real initial_waterLevel=0.2;
  Real waterLevel(start=initial_waterLevel);
  Real error;
  Real Pcontrol;
  Real Icontrol;
  Real Dcontrol;
  Real leakRate=0.1;
initial equation
  error = target_height - initial_waterLevel;
equation
  Pcontrol = Kp * error;
  Icontrol = Ki * integral(error * dt);
  Dcontrol = Kd * derivative(error * dt);
  waterLevel = Pcontrol + Icontrol + Dcontrol - leakRate;
end PIDController;