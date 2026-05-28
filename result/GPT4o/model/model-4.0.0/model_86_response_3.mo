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
  // Motion equations
  der(h) = v;
  der(v) = if isOnGround then 0 else -g;

  // Collision detection
  isOnGround = h <= radius and v <= 0;

  // Collision response
  when isOnGround then
    v = -e * v;
  end when;

  // Ensure the ball does not go below the ground
  assert(h >= radius, "Ball has penetrated the ground!");

end BouncingBall;