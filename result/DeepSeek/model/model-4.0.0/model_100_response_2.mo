model ExampleModel
  Real radius = 5;
  Real circumference;
  Real area;
equation 
  (circumference, area) = CircleProperties(radius);
end ExampleModel;