model SpringMassDamper
 // Parameters
  parameter Real k = 1 "Spring coefficient";
  parameter Real c = 0.1 "Damping coefficient";
  parameter Real m = 1 "Mass";

  // Variables
  Real x(start = 1) "Displacement";
  Real v "Velocity";
  Real F "Resultant force";

equation
  // Force balance: F = -k*x - c*v
  F = -k*x - c*v;

  // Newton's second law: m*der(v) = F
  m*der(v) = F;

  // Definition of velocity: v = der(x)
  v = der(x);
end SpringMassDamper;