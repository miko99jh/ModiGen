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
  // Resultant force based on spring and damping effects
  F = -k*x - c*v;

  // Newton's second law: F = m * a, where a is the derivative of velocity
  m*der(v) = F;

  // Derivative of displacement is the velocity
  der(x) = v;
end SpringMassDamper;