model Example
  Real radius = 5;
  Real circumference;
  Real area;
equation 
  CircleProperties(radius, circumference, area);
  annotation(experiment(StopTime=0.1));
end Example;