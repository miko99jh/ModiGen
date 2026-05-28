model SubsamplingWithIntegers
  parameter Real dt = 0.1;
  Integer tick = 0 (start = 0);
  Real x = 0.0 (start = 0);
  Real y = 0.0 (start = 0);
  Real z = 0.0 (start = 0);
initial equation
  when tick_changed(tick) then
    x = time;
    y = time;
  end when;
equation
  when tick_changed(tick) then
    y = time;
  end when;
  when (tick-1) mod 2 == 0 then
    z = time;
  end when;
  der(tick) = 1/dt;
end SubsamplingWithIntegers;