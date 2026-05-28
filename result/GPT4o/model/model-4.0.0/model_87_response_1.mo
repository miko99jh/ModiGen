model SimplePendulum
 // Parameters
  parameter Real L = 1 "Length of the pendulum (m)";
  parameter Real m = 1 "Mass of the pendulum (kg)";
  parameter Real g = 9.81 "Acceleration due to gravity (m/s^2)";

  // State variables
  Real theta(start = 1.5) "Angle from the vertical (rad)";
  Real omega(start = 0) "Angular velocity (rad/s)";

equation
  // Equation of motion for the pendulum
  der(theta) = omega;
  der(omega) = -(g/L) * sin(theta);

end SimplePendulum;