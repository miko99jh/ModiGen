function CircleProperties
 input Real radius "Radius of the circle";
  output Real circumference "Circumference of the circle";
  output Real area "Area of the circle";
protected
  Real diameter "Diameter of the circle";
algorithm
  // Calculate the diameter
  diameter := 2 * radius;
  
  // Calculate the circumference
  circumference := 2 * 3.14159 * radius;
  
  // Calculate the area
  area := 3.14159 * radius * radius;
end CircleProperties;