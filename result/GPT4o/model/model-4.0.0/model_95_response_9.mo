model SpringMassDamper
 // Parameters
  parameter Real k = 1;   // Spring coefficient
  parameter Real c = 0.1; // Damping coefficient
  parameter Real m = 1;   // Mass

  // Variables
  Real x(start=1); // Displacement, starting at 1
  Real v;          // Velocity
  Real F;          // Resultant force

equation
  // Force equation based on spring and damping effects
  F = -k*x - c*v;

  // Newton's second law: relate force to acceleration (derivative of velocity)
  m*der(v) = F;

  // Define the derivative of displacement
  der(x) = v;
end SpringMassDamper;