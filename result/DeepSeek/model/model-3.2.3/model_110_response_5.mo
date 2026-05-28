model SubsamplingWithIntegers
  parameter Real dt = 0.1;
  Integer tick(start=0);
  Real x(start=0), y(start=0), z(start=0);
equation
  when sample(tick, dt) then
    tick = tick + 1;
    x = time;
    y = time;
  end when;
  when sample((tick-1) mod 2 == 0, dt) then
    z = time;
  end when;
end SubsamplingWithIntegers;