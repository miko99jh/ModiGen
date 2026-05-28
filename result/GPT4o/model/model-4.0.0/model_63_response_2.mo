model SignalVoltage
 extends Modelica.Electrical.Analog.Icons.VoltageSource;

  // Components
  Modelica.Electrical.Analog.Interfaces.PositivePin p;
  Modelica.Electrical.Analog.Interfaces.NegativePin n;
  Modelica.Blocks.Interfaces.RealInput v "Voltage between pin p and n as input signal";
  Modelica.Units.SI.Current i "Current flowing from pin p to pin n";

equation
  // Equations
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
end SignalVoltage;