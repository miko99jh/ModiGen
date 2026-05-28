model SignalVoltage
  extends Modelica.Electrical.Analog.Icons.VoltageSource;
  Modelica.Electrical.Analog.Interfaces.PositivePin p;
  Modelica.Electrical.Analog.Interfaces.NegativePin n;
  Modelica.Blocks.Interfaces.RealInput v;
  Modelica.Units.SI.Current i;
equation 
  v = p.v - n.v;
  0 = p.i + n.i;
  i = p.i;
end SignalVoltage;