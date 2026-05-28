model SimplePendulum
 parameter Real L = 1; // Length of the pendulum
  parameter Real m = 1; // Mass of the pendulum
  parameter Real g = 9.81; // Gravitational acceleration

  // State variables
  Real theta(start=1.5); // Angle from the vertical in radians
  Real omega(start=0); // Angular velocity in rad/s

  // Differential equation for the pendulum motion
equation
  der(theta) = omega;
  der(omega) = -(g/L) * sin(theta);

  // Output the current angle and angular velocity
  annotation (uses(Modelica));
end SimplePendulum;