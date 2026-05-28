model BouncingBall
  parameter Real r = 0.1 "Ball radius";
  parameter Real h0 = 1.0 "Initial height";
  parameter Real v0 = 0.0 "Initial velocity";
  parameter Real g = 9.81 "Gravity acceleration";
  parameter Real e = 0.9 "Recovery coefficient";
  Real h(start=h0) "Height";
  Real v(start=v0) "Velocity";
  Real a(start=-g) "Acceleration";
  Boolean hit_ground = false "Ball hits the ground";
equation
  // Newton's second law
  der(v) = a;
  der(h) = v;
  // Gravity force
  a = -g;
  // Ball hits the ground
  when h <= 0 and not hit_ground then
    v = -e*v;
    a = -g;
    hit_ground = true;
  end when;
  // Ball bounces
  when h > 0 and hit_ground then
    hit_ground = false;
  end when;
end BouncingBall;