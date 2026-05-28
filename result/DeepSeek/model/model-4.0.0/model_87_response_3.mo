model SimplePendulum
  parameter Real L=1 "Pendulum length";
  parameter Real m=1 "Mass of pendulum";
  parameter Real g=9.81 "Gravity constant";
  Real theta(start=1.5) "Angle of pendulum";
  Real omega(start=0) "Angular velocity of pendulum";
  Real F "Force applied to pendulum";
equation
  // Define the differential equations for the pendulum
  // (You may need to use the sin and cos functions from the Modelica Standard Library)
  // The equations should be in the form:
  // der(theta) =...
  // der(omega) =...
  // F =...
  // You can use the Modelica.Constants.pi constant for π
end SimplePendulum;