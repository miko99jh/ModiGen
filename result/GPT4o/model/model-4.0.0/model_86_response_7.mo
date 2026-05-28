model BouncingBall
 // Parameters
  parameter Real radius = 0.1 "Radius of the ball in meters";
  parameter Real e = 0.9 "Coefficient of restitution";
  parameter Real g = 9.81 "Acceleration due to gravity in m/s^2";

  // State variables
  Real h(start = 1) "Height of the ball in meters";
  Real v(start = 0) "Velocity of the ball in m/s";

  // Event to detect collision with the ground
  Boolean isOnGround;

equation
  // Differential equations
  der(h) = v;
  der(v) = if isOnGround then 0 else -g;

  // Event when the ball hits the ground
  when h <= radius then
    v = -e * v;
    reinit(h, radius);
  end when;

  // Determine if the ball is on the ground
  isOnGround = h <= radius and v <= 0;

end BouncingBall;