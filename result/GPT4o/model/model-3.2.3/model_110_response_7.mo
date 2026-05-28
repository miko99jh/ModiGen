model SubsamplingWithIntegers
 // Variables
  Integer tick(start=0);
  Real x(start=0);
  Real y(start=0);
  Real z(start=0);

  // Parameters
  parameter Real tickInterval = 0.1; // Interval for clock ticks

  // Equations
  equation
    // Increment tick every tickInterval seconds
    when time >= tickInterval * (tick + 1) then
      tick = tick + 1;
      x = time;
      y = time;
    end when;

    // Update z when (tick-1) mod 2 == 0
    when (tick - 1) mod 2 == 0 then
      z = time;
    end when;
end SubsamplingWithIntegers;