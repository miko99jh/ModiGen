model SimplePendulum
 parameter Real L = 1; // Length of the pendulum
  parameter Real m = 1; // Mass of the pendulum
  parameter Real g = 9.81; // Gravity constant

  // State variables
  Real theta(start=1.5); // Angle from the vertical in radians
  Real omega(start=0); // Angular velocity in rad/s

  // Equation for the pendulum dynamics
equation
  // Differential equation for angular velocity
  der(theta) = omega;
  
  // Differential equation for angular acceleration
  der(omega) = -(g/L) * sin(theta);

  // Initial conditions
  initial equation
    theta = 1.5;
    omega = 0;
end SimplePendulum;