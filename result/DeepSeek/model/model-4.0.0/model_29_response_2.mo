block SpeedControl
  extends Modelica.Icons.Example;
  parameter Real k_p=0.0614;
  parameter Real k_I=0.0723;
  Modelica.Blocks.Interfaces.RealInput N_des(unit="rad/s")=0;
  Modelica.Blocks.Interfaces.RealInput N(unit="rad/s")=0;
  Modelica.Blocks.Interfaces.RealOutput Theta(unit="deg")=8.9;
  protected Modelica.Units.NonSI.Angle_deg x_d=8.973;

equation
  when Clock() then
    x_d = x_d + (N_des - N)*k_I*interval();
    Theta = k_p*(N_des - N) + x_d;
  end when;
end SpeedControl;