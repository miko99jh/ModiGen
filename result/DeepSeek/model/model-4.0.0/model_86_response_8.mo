model BouncingBall
  parameter Real radius = 0.1 "Ball radius";
  parameter Real h0 = 1.0 "Initial height";
  parameter Real v0 = 0.0 "Initial velocity";
  parameter Real g = 9.81 "Gravity acceleration";
  parameter Real e = 0.9 "Recovery coefficient";
  Real h(start=h0) "Height";
  Real v(start=v0) "Velocity";
  Boolean bounce "Bounce flag";
equation
  der(h) = v;
  der(v) = -g;
  when h <= 0 and not bounce then
    v = -e*v;
    h = 0;
    bounce = true;
  end when;
  when bounce and h >= 0 then
    bounce = false;
  end when;
end BouncingBall;