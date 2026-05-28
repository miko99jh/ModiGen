model SubsamplingWithIntegers
  parameter Real dt = 0.1 "Time step";
  Integer tick(start=0) = 0;
  Real x(start=0) = 0;
  Real y(start=0) = 0;
  Real z(start=0) = 0;
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