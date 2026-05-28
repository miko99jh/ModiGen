model BouncingBall
 parameter Real radius = 0.1 "Radius of the ball";
  parameter Real e = 0.9 "Coefficient of restitution";
  parameter Real g = 9.81 "Acceleration due to gravity (m/s^2)";
  parameter Real initialHeight = 1 "Initial height of the ball (m)";
  parameter Real initialVelocity = 0 "Initial velocity of the ball (m/s)";

  Real height(start=initialHeight) "Height of the ball above the ground";
  Real velocity(start=initialVelocity) "Vertical velocity of the ball";

  Boolean isFalling(start=true) "Flag to indicate if the ball is falling";

equation
  // Differential equations for motion
  der(height) = velocity;
  der(velocity) = if isFalling then -g else 0;

  // Condition for bouncing
  when height <= radius then
    velocity = -e * velocity;
    isFalling = true;
  end when;

  // Condition for free fall
  when velocity < 0 then
    isFalling = true;
  elsewhen velocity > 0 then
    isFalling = false;
  end when;

end BouncingBall;