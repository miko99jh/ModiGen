model BouncingBall
  parameter Real r = 0.1 "Ball radius";
  parameter Real h0 = 1 "Initial height";
  parameter Real v0 = 0 "Initial velocity";
  parameter Real g = 9.81 "Gravity acceleration";
  parameter Real e = 0.9 "Recovery coefficient";
  Real h(start = h0) "Height";
  Real v(start = v0) "Velocity";
  Real a(start = -g) "Acceleration";
  Real F_g = m*g "Gravitational force";
  Real F_d = -e*N "Drag force";
  Real m = pi*r^2*h "Mass";
  Real N = m*v "Normal force";
equation
  der(v) = a;
  der(h) = v;
  a = (F_g + F_d)/m;
  when h < 0 then
    v = -v*e;
    h = 0;
  end when;
end BouncingBall;