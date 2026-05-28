model SpringMassDamper
  parameter Real m = 1 "Mass";
  parameter Real k = 1 "Spring coefficient";
  parameter Real c = 0.1 "Damping coefficient";
  Real x(start=1) "Displacement";
  Real v "Velocity";
  Real F "Resultant force";
equation 
  F = m * der(v) + c * v + k * x;
  der(x) = v;
end SpringMassDamper;