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
  // Differential equation for velocity
  der(v) = if isOnGround then 0 else -g;

  // Differential equation for height
  der(h) = v;

  // Event condition for collision with the ground
  isOnGround = h <= radius and v <= 0;

  // When the ball hits the ground, reverse and reduce the velocity
  when isOnGround then
    reinit(v, -e * v);
    reinit(h, radius);
  end when;

  // Ensure the height does not go below the radius
  assert(h >= radius, "Ball has penetrated the ground!");

end BouncingBall;