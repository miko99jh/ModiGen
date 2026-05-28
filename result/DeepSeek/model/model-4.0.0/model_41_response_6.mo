block PI extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO
  parameter Real kd;
  parameter Real Td(min=Modelica.Constants.small) = 1;
  Real x(start=0) = if Clock() then x + (u/Td) else x;
  output Real y = kd * (u + x);
equation
  when Clock() then
    x = x + (u/Td);
    y = kd * (u + x);
  end when;
end PI;