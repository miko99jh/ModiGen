model BouncingBall
  parameter Real r = 0.1 "Radius of the ball";
  parameter Real h0 = 1.0 "Initial height of the ball";
  parameter Real v0 = 0.0 "Initial velocity of the ball";
  parameter Real g = 9.81 "Acceleration due to gravity";
  parameter Real e = 0.9 "Recovery coefficient";
  Real h(start=h0) "Height of the ball";
  Real v(start=v0) "Velocity of the ball";
  Boolean is_falling = true "Ball is falling";

equation
  // Differential equation for velocity
  der(v) = if is_falling then g - e*g else -g;

  // Differential equation for height
  der(h) = v;

  // Ball hits the ground
  when h <= 0 and is_falling then
    h = 0;
    v = -v*e;
    is_falling = false;
  end when;

  // Ball is back up
  when h >= 0 and not is_falling then
    is_falling = true;
  end when;
end BouncingBall;