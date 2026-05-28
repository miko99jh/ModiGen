model SpringMassDamper
 // Parameters
  parameter Real k = 1; // Spring coefficient
  parameter Real c = 0.1; // Damping coefficient
  parameter Real m = 1; // Mass

  // Variables
  Real x(start=1); // Displacement, starting at 1
  Real v; // Velocity
  Real F; // Resultant force

equation
  // Force equation: F = -k*x - c*v
  F = -k*x - c*v;

  // Newton's second law: m*der(v) = F
  m*der(v) = F;

  // Derivative of displacement: der(x) = v
  der(x) = v;
end SpringMassDamper;