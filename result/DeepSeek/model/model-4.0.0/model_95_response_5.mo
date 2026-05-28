model SpringMassDamper
 parameter Real k = 1 "Spring constant";
  parameter Real c = 0.1 "Damping constant";
  parameter Real m = 1 "Mass";
  Real x(start=1) "Displacement";
  Real v "Velocity";
  Real F "Resultant force";
equation 
  F = -k*x - c*v;
  der(v) = F/m;
  der(x) = v;
end SpringMassDamper;