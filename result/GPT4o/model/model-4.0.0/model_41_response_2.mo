block PI
 extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSISO;

  parameter Real kd "Gain of the discrete PI controller";
  parameter Real Td(min=Modelica.Constants.small) "Time constant of the discrete PI controller";

  output Real x(start=0) "State of the discrete PI controller";

protected 
  Real u_prev(start=0) "Previous input value";

equation 
  when Clock() then
    // Integral State Update
    x = pre(x) + u / Td;
    
    // Control Output
    y = kd * (u + x);
  end when;

end PI;