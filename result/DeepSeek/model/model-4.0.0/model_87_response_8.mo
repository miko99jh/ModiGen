model SimplePendulum
  parameter Real L=1 "Pendulum length";
  parameter Real m=1 "Mass of pendulum";
  parameter Real g=9.81 "Gravity constant";
  Real theta(start=1.5) "Angle of pendulum";
  Real omega(start=0) "Angular velocity of pendulum";
  Real tau "Torque";
initial equation
  tau = -m*g*L*sin(theta);
equation
  // Define the differential equation for the pendulum
  // TODO: Implement the differential equation
  der(theta) = omega;
  der(omega) = tau/m;
end SimplePendulum;