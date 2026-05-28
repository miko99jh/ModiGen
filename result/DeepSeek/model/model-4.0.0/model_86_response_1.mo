model BouncingBall
  parameter Real radius=0.1 "Ball radius";
  parameter Real initialHeight=1.0 "Initial height";
  parameter Real initialVelocity=0.0 "Initial velocity";
  parameter Real g=9.81 "Gravity acceleration";
  parameter Real e=0.9 "Recovery coefficient";
  Real z(start=initialHeight) "Height";
  Real v(start=initialVelocity) "Velocity";
  Boolean onGround(start=true) "Ball is on ground";
equation
  // Newton's second law
  der(v) = if onGround then -g*e else -g;
  // Ball hits the ground
  onGround = (z <= radius);
  // Ball's motion
  der(z) = v;
end BouncingBall;