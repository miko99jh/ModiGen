model BouncingBall1 "Simple model of a bouncing ball"
  constant Real g = 9.81 "Gravity constant";
  parameter Real c = 0.9 "Coefficient of restitution";
  parameter Real redius = 0.1 "Radius of the ball";
  Real height(start=1) "Height of the ball center";
  Real velocity(start=0) "Velocity of the ball";
equation
  der(height) = velocity;
  der(velocity) = -g;
  when height<=redius then
    reinit(velocity,-c*pre(velocity));
  end when;
end BouncingBall1;
