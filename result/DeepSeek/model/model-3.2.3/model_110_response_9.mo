model SubsamplingWithIntegers
  parameter Real dt = 0.1 "Time step";
  Integer tick(start=0) "Clock ticks";
  Real x(start=0) "Captures the current simulation time when the clock tick changes";
  Real y(start=0) "Captures the current simulation time when the clock tick changes";
  Real z(start=0) "Captures the current simulation time when the clock tick satisfies a modulo condition";

equation
  // Increment the clock ticks every dt seconds
  when sample(tick, dt) then
    tick = tick + 1;
  end when;

  // Update x and y whenever the clock ticks change
  when sample(tick, dt) then
    x = time;
    y = time;
  end when;

  // Update z when the clock tick satisfies a modulo condition
  when sample((tick-1) mod 2, dt) then
    z = time;
  end when;
end SubsamplingWithIntegers;