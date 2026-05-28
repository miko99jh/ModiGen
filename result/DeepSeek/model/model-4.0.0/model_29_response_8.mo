block SpeedControl
  parameter Real k_p=0.0614;
  parameter Real k_I=0.0723;
  Modelica.Blocks.Interfaces.RealInput N_des(start=0);
  Modelica.Blocks.Interfaces.RealInput N(start=0);
  Modelica.Blocks.Interfaces.RealOutput Theta(start=8.9, fixed=true) "Throttle angle";
  protected Modelica.Units.NonSI.Angle_deg x_d=8.973;
equation
  when Clock() then
    x_d = x_d + (N_des - N)*k_I*interval();
    Theta = k_p*(N_des - N) + x_d;
  end when;
end SpeedControl;