model SpringMassDamper
  parameter Real m = 1 "Mass";
  parameter Real k = 1 "Spring coefficient";
  parameter Real c = 0.1 "Damping coefficient";
  Real x(start = 1) "Displacement";
  Real v "Velocity";
  Real F "Resultant force";
equation 
  // Define the resultant force based on the spring and damping effects
  F = k*x + c*v;
  // Use Newton's second law to relate this force to the derivative of velocity
  m*der(v) = F;
  // Define the derivative of displacement
  der(x) = v;
end SpringMassDamper;