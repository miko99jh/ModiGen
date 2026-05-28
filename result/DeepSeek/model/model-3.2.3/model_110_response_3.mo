model SubsamplingWithIntegers
  parameter Real dt = 0.1;
  Integer tick = 0 (start = 0);
  Real x = 0.0 (start = 0.0);
  Real y = 0.0 (start = 0.0);
  Real z = 0.0 (start = 0.0);
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