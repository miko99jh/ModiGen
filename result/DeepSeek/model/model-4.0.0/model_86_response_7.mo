model BouncingBall
  parameter Real r=0.1 "radius of the ball";
  parameter Real h0=1 "initial height";
  parameter Real v0=0 "initial velocity";
  parameter Real g=9.81 "acceleration due to gravity";
  parameter Real e=0.9 "recovery coefficient";
  Real h(start=h0) "height of the ball";
  Real v(start=v0) "velocity of the ball";
  Boolean onGround=true "ball is on the ground";
equation
  der(v) = -g + if onGround then -e*v else 0;
  der(h) = v;
  onGround = h <= r;
end BouncingBall;