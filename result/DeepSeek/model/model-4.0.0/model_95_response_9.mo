model SpringMassDamper
  parameter Real x(start=1) "Displacement";
  parameter Real v "Velocity";
  parameter Real F "Resultant force applied to the mass";
  parameter Real k=1 "Spring coefficient";
  parameter Real c=0.1 "Damping coefficient";
  parameter Real m=1 "Particle mass";
equation
  F = k*x + c*v;
  der(v) = (F - c*v) / m;
  der(x) = v;
end SpringMassDamper;