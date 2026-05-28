block SpeedControl
  extends Modelica.Icons.Example;
  parameter Real k_p = 0.0614 "Proportional gain";
  parameter Real k_I = 0.0723 "Integral gain";
  Modelica.Blocks.Interfaces.RealInput N_des "Desired speed";
  Modelica.Blocks.Interfaces.RealInput N "Measured speed";
  Modelica.Blocks.Interfaces.RealOutput Theta "Throttle angle";
protected 
  Real x_d = 8.973 "Integral state";
algorithm 
  when Clock() then
    x_d = x_d + (N_des - N)*k_I*interval();
    Theta = k_p*(N_des - N) + x_d;
  end when;
end SpeedControl;