model SimplePendulum
 parameter Real L = 1; // Length of the pendulum
  parameter Real m = 1; // Mass of the pendulum
  parameter Real g = 9.81; // Gravitational acceleration

  // State variables
  Real theta(start=1.5); // Initial angle in radians
  Real omega(start=0); // Initial angular velocity in rad/s

  // Equation for the pendulum motion
equation
  // Differential equation for angular velocity
  der(theta) = omega;
  
  // Differential equation for angular acceleration
  der(omega) = -(g/L) * sin(theta);

  // Output the current angle and angular velocity
  annotation (uses(Modelica));
end SimplePendulum;