model BouncingBall
  parameter Real r = 0.1 "Radius of the ball";
  parameter Real h0 = 1 "Initial height of the ball";
  parameter Real v0 = 0 "Initial velocity of the ball";
  parameter Real g = 9.81 "Acceleration due to gravity";
  parameter Real e = 0.9 "Recovery coefficient";
  Real h(start=h0) "Height of the ball";
  Real v(start=v0) "Velocity of the ball";
  Real a "Acceleration of the ball";
  Boolean bounce = false "Bounce flag";
equation
  // Newton's second law
  a = g - v*v/h*e;
  // Ball motion
  der(v) = a;
  der(h) = v;
  // Bounce condition
  if h < 0 and not bounce then
    v = -v*e;
    h = 0;
    bounce = true;
  elseif h >= 0 and bounce then
    bounce = false;
  end if;
end BouncingBall;