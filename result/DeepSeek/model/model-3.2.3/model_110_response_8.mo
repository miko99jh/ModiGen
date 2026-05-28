model SubsamplingWithIntegers
  parameter Real dt = 0.1;
  Integer tick(start=0);
  Real x(start=0);
  Real y(start=0);
  Real z(start=0);
initial equation
  when tick_ticks(0, dt) then
    tick = tick + 1;
    x = time;
    y = time;
    if (mod(tick-1, 2) == 0) then
      z = time;
    end if;
  end when;
equation
  // No differential equations
end SubsamplingWithIntegers;