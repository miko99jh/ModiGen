model SimplePendulum
 parameter Real L = 1; // Length of the pendulum
  parameter Real m = 1; // Mass of the pendulum
  parameter Real g = 9.81; // Gravitational acceleration

  // State variables
  Real theta(start=1.5); // Initial angle in radians
  Real omega(start=0); // Initial angular velocity in rad/s

equation
  // Differential equation for the pendulum motion
  der(theta) = omega;
  der(omega) = -(g/L) * sin(theta);

  // Output for visualization
  Real x = L * sin(theta);
  Real y = -L * cos(theta);

end SimplePendulum;