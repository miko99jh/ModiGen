block SpeedControl
  extends Modelica.Icons.Example;
  parameter Real k_p=0.0614 "Proportional gain";
  parameter Real k_I=0.0723 "Integral gain";
  Modelica.Blocks.Interfaces.RealInput N_des(unit="rad/s", start=0) "Desired speed";
  Modelica.Blocks.Interfaces.RealInput N(unit="rad/s", start=0) "Measured speed";
  Modelica.Blocks.Interfaces.RealOutput Theta(unit="deg", start=8.9) "Throttle angle";
  protected 
  Real x_d=8.973 "Integral state";
  when Clock() then
    x_d = x_d + (N_des - N)*k_I*interval();
    Theta = k_p*(N_des - N) + x_d;
  end when;
end SpeedControl;