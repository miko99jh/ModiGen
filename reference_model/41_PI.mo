block PI "Discrete-time PI controller"
  extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO;
  parameter Real kd "Gain of discrete PI controller";
  parameter Real Td(min=Modelica.Constants.small)
    "Time constant of discrete PI controller";
  output Real x(start=0) "Discrete PI state";
equation
  when Clock() then
     x = previous(x) + u/Td;
     y = kd*(x + u);
  end when;
end PI;
