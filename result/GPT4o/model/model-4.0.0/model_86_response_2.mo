model BouncingBall
 parameter Real radius = 0.1 "Radius of the ball";
  parameter Real e = 0.9 "Coefficient of restitution";
  parameter Real g = 9.81 "Acceleration due to gravity";
  parameter Real initialHeight = 1 "Initial height of the ball";
  parameter Real initialVelocity = 0 "Initial velocity of the ball";

  Real height(start = initialHeight) "Height of the ball";
  Real velocity(start = initialVelocity) "Velocity of the ball";

equation
  // Differential equation for velocity
  der(velocity) = -g;

  // Differential equation for height
  der(height) = velocity;

  // Event for bouncing
  when height <= radius then
    velocity = -e * velocity;
    reinit(height, radius); // Ensure the ball doesn't go below the ground
  end when;

end BouncingBall;