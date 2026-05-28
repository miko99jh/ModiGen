model BouncingBall
  parameter Real radius = 0.1 "Ball radius";
  parameter Real initialHeight = 1 "Initial height";
  parameter Real initialVelocity = 0 "Initial velocity";
  parameter Real g = 9.81 "Gravity acceleration";
  parameter Real bounceCoefficient = 0.9 "Bounce coefficient";
  Real height(start = initialHeight) "Ball height";
  Real velocity(start = initialVelocity) "Ball velocity";
  Real acceleration = -g "Ball acceleration";
  Boolean isBouncing = false "Ball is bouncing";
equation 
  // Ball movement equation
  der(velocity) = acceleration;
  der(height) = velocity;

  // Ball bounce equation
  if (height <= 0) then
    velocity = -bounceCoefficient * velocity;
    height = 0;
    isBouncing = true;
  else
    isBouncing = false;
  end if;
end BouncingBall;