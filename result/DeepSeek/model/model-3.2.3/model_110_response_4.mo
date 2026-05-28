model SubsamplingWithIntegers
  parameter Real dt = 0.1 "Time step";
  Integer tick(start=0) "Clock tick counter";
  Real x(start=0) "Output variable x";
  Real y(start=0) "Output variable y";
  Real z(start=0) "Output variable z";
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