block SpeedControl1
  "Discrete control of crankshaft speed by throttle actuation"
  parameter Real k_p = 0.0614 "Proportional gain";
  parameter Real k_I = 0.0723 "Integral gain";
  Modelica.Blocks.Interfaces.RealInput N_des(unit="rad/s", start=0) "Desired speed, (rad/s)" ;
  Modelica.Blocks.Interfaces.RealInput N(unit="rad/s", start=0) "Measured speed, (rad/s)";
  Modelica.Blocks.Interfaces.RealOutput Theta(start=8.9, unit="deg")
    "Throttle angle (deg)";
protected
  Modelica.Units.NonSI.Angle_deg x_d(start=8.973, fixed=true);
equation
  when Clock() then
     x_d = previous(x_d) + k_I*interval()*(previous(N_des) - previous(N));
     Theta = k_p*(N_des - N) + x_d;
  end when;
end SpeedControl1;
