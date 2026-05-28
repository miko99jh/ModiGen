model BouncingBall
  parameter Real radius = 0.1 "Ball radius";
  parameter Real initialHeight = 1 "Initial height of the ball";
  parameter Real initialVelocity = 0 "Initial velocity of the ball";
  parameter Real g = 9.81 "Gravity";
  parameter Real recoveryCoefficient = 0.9 "Recovery coefficient";

  Real height(start = initialHeight) "Height of the ball";
  Real velocity(start = initialVelocity) "Velocity of the ball";
  Real acceleration "Acceleration of the ball";

equation
  // Newton's second law
  acceleration = -g + recoveryCoefficient * velocity;

  // Ball's motion
  der(velocity) = acceleration;
  der(height) = velocity;

  // Ball's bounce
  when height <= 0 then
    velocity = -recoveryCoefficient * velocity;
    height = 0;
  end when;
end BouncingBall;