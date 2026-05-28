model BouncingBall
 parameter Real radius = 0.1 "Radius of the ball";
  parameter Real e = 0.9 "Coefficient of restitution";
  parameter Real g = 9.81 "Acceleration due to gravity";
  parameter Real initialHeight = 1 "Initial height of the ball";
  parameter Real initialVelocity = 0 "Initial velocity of the ball";

  Real h(start=initialHeight) "Height of the ball";
  Real v(start=initialVelocity) "Velocity of the ball";

equation
  // Differential equation for velocity
  der(v) = -g;

  // Differential equation for height
  der(h) = v;

  // Event for bouncing
  when h <= radius then
    reinit(v, -e*v);
    reinit(h, radius);
  end when;

end BouncingBall;