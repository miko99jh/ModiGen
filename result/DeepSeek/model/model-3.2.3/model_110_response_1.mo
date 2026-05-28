model SubsamplingWithIntegers
  parameter Real dt = 0.1 "Time step";
  Integer tick(start=0) "Clock ticks";
  Real x(start=0) "Captures the current simulation time when the clock tick changes";
  Real y(start=0) "Captures the current simulation time when the clock tick changes";
  Real z(start=0) "Captures the current simulation time when the clock tick satisfies a modulo condition";

equation
  // Increment clock ticks every 0.1 seconds
  when sample(tick, dt) then
    tick = tick + 1;
  end when;

  // Update x and y with the current time whenever tick changes
  when tick > last(tick) then
    x = time;
    y = time;
  end when;

  // Update z with the current time when (tick-1) mod 2 == 0
  when (tick - 1) mod 2 == 0 then
    z = time;
  end when;
end SubsamplingWithIntegers;