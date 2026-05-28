model SimplePendulum
  parameter Real L=1 "Length of the pendulum";
  parameter Real m=1 "Mass of the pendulum";
  parameter Real g=9.81 "Gravity constant";
  Real theta(start=1.5) "Angle of the pendulum";
  Real omega(start=0) "Angular velocity of the pendulum";
  Real F "Force applied to the pendulum";
equation
  // Newton's second law for rotation
  m*L^2*der(omega) = -m*g*L*sin(theta) + F;
  // Angular displacement equation
  der(theta) = omega;
end SimplePendulum;