model BouncingBall
  parameter Real radius = 0.1 "Ball radius";
  parameter Real initialHeight = 1 "Initial height";
  parameter Real initialVelocity = 0 "Initial velocity";
  parameter Real g = 9.81 "Gravity acceleration";
  parameter Real recoveryCoefficient = 0.9 "Recovery coefficient";

  Real height(start=initialHeight) "Height";
  Real velocity(start=initialVelocity) "Velocity";
  Real acceleration "Acceleration";

equation
  acceleration = -g; // Free fall
  der(velocity) = acceleration; // Velocity derivative
  der(height) = velocity; // Height derivative

  // Bounce equation
  when height <= 0 then
    velocity = -recoveryCoefficient * velocity;
    height = 0;
  end when;
end BouncingBall;