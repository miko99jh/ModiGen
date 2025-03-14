model SpringMassDamper1 "Spring mass damping system"
  parameter Real k = 1 "Spring stiffness";
  parameter Real m = 1 "Mass";
  parameter Real c = 0.1 "Damping coefficient";

  Real x(start=1) "Displacement";
  Real v "Velocity";
  Real F "Force applied to the mass";

equation
  // Equation of motion of spring-mass-damping system
  F = -k * x - c * v; // The resultant force of the spring and the damping force
  m * der(v) = F; // newton's second law
  der(x) = v;

end SpringMassDamper1;
