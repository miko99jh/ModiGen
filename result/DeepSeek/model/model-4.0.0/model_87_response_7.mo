model SimplePendulum
  parameter Real L=1 "Pendulum length";
  parameter Real m=1 "Mass of the pendulum";
  parameter Real g=9.81 "Gravity constant";
  Real theta(start=1.5) "Angle of the pendulum";
  Real omega(start=0) "Angular velocity of the pendulum";
  // Define the equations
  equation
    // TODO: Implement the differential equations
end SimplePendulum;