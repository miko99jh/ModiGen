block PI extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real kd (start=1) "Controller gain";
  parameter Real Td(min=Modelica.Constants.small, start=1) "Time constant";
  Real x(start=0) "Integral state";
equation
  when Clock() then
    x = x + u/Td;
    y = kd*(u + x);
  end when;
end PI;