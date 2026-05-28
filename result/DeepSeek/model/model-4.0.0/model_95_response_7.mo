model SpringMassDamper
  parameter Real m = 1 "Mass";
  parameter Real k = 1 "Spring coefficient";
  parameter Real c = 0.1 "Damping coefficient";
  Real x(start=1) "Displacement";
  Real v "Velocity";
  Real F "Resultant force";
initial equation
  v = 0;
equation
  F = k*x + c*v;
  m*der(v) = F;
  der(x) = v;
end SpringMassDamper;