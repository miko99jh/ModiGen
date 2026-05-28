model SpeedControl
 // Parameters
  parameter Real k_p = 0.0614 "Proportional gain";
  parameter Real k_I = 0.0723 "Integral gain";

  // Inputs
  Modelica.Blocks.Interfaces.RealInput N_des(unit="rad/s") "Desired speed";
  Modelica.Blocks.Interfaces.RealInput N(unit="rad/s") "Measured speed";

  // Output
  Modelica.Blocks.Interfaces.RealOutput Theta(unit="deg") "Throttle angle";

protected 
  // Integral state
  Modelica.Units.NonSI.Angle_deg x_d(start=8.973, fixed=true) "Integral state";

equation 
  // Discrete-time PI control law
  when Clock() then
    // Update integral state
    x_d = previous(x_d) + k_I * (previous(N_des) - previous(N)) * interval();

    // Calculate throttle angle
    Theta = k_p * (N_des - N) + x_d;
  end when;
end SpeedControl;