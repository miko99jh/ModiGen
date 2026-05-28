model BouncingBall
 parameter Real radius = 0.1 "Radius of the ball";
  parameter Real e = 0.9 "Coefficient of restitution";
  parameter Real g = 9.81 "Acceleration due to gravity";
  parameter Real initialHeight = 1 "Initial height of the ball";
  parameter Real initialVelocity = 0 "Initial velocity of the ball";

  Real height(start=initialHeight) "Height of the ball";
  Real velocity(start=initialVelocity) "Velocity of the ball";
  Boolean isFalling(start=true) "Flag to indicate if the ball is falling";

equation
  // Dynamics of the ball
  der(height) = velocity;
  der(velocity) = if isFalling then -g else g;

  // Condition for bouncing
  when height <= radius then
    velocity = -e * velocity;
    isFalling = not isFalling;
  end when;

  // Ensure the ball doesn't go below the ground
  when height < radius then
    height = radius;
  end when;

end BouncingBall;