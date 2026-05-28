block PI extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real kd "Gain of the discrete PI controller";
  parameter Real Td(min=Modelica.Constants.small) "Time constant of the discrete PI controller";
  Real x(start=0) "State of the discrete PI controller";
equation
  when Clock() then
    x = x + (u/Td);
    y = kd*(u + x);
  end when;
end PI;