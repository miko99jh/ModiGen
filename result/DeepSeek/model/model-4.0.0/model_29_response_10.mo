block SpeedControl
  extends Modelica.Icons.Example;
  parameter Real k_p = 0.0614 "Proportional gain";
  parameter Real k_I = 0.0723 "Integral gain";
  Modelica.Blocks.Interfaces.RealInput N_des(unit="rad/s")=0 "Desired speed";
  Modelica.Blocks.Interfaces.RealInput N(unit="rad/s")=0 "Measured speed";
  Modelica.Blocks.Interfaces.RealOutput Theta(unit="deg")=8.9 "Throttle angle";
  protected 
  Real x_d=8.973 "Integral state";
  algorithm 
    when Clock() then
      // Integral State Update
      x_d = x_d + (k_I * (previous(N_des) - previous(N)) * interval());
      // Output Calculation
      Theta = k_p * (N_des - N) + x_d;
    end when;
  end SpeedControl;