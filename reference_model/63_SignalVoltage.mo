model SignalVoltage
  "Generic voltage source using the input signal as source voltage"
  extends Modelica.Electrical.Analog.Icons.VoltageSource;
  Modelica.Electrical.Analog.Interfaces.PositivePin p;
  Modelica.Electrical.Analog.Interfaces.NegativePin n;
  Modelica.Blocks.Interfaces.RealInput v(unit="V") "Voltage between pin p and n (= p.v - n.v) as input signal";
  Modelica.Units.SI.Current i "Current flowing from pin p to pin n";
equation
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
end SignalVoltage;
