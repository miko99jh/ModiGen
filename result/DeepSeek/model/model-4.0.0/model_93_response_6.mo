model PIDController
 parameter Real Kp = 1;
  parameter Real Ki = 0.2;
  parameter Real Kd = 0.1;
  Real error;
  Real Pcontrol;
  Real Icontrol;
  Real Dcontrol;
  Real waterLevel = 0.2;
  Real target_height = 1;
  Real leak = -0.1;
  Real control_output;
  initial equation 
    error = target_height - waterLevel;
    Pcontrol = Kp * error;
    Icontrol = Ki * error;
    Dcontrol = Kd * (error - pre(error));
    control_output = Pcontrol + Icontrol + Dcontrol;
  equation 
    der(waterLevel) = control_output + leak;
end PIDController;