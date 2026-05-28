model SpringMassDamper
  parameter Real k = 1 "Spring constant";
  parameter Real c = 0.1 "Damping constant";
  parameter Real m = 1 "Mass";
  Real x(start=1) "Displacement";
  Real v "Velocity";
  Real F "Force";
equation 
  // Define the equations here
  // F = -kx -cv + m*x'';
  // v = x'
  // x = x
end SpringMassDamper;