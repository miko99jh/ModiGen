model SignalVoltage
 extends Modelica.Electrical.Analog.Icons.VoltageSource;

  // Components
  Modelica.Electrical.Analog.Interfaces.PositivePin p;
  Modelica.Electrical.Analog.Interfaces.NegativePin n;
  Modelica.Blocks.Interfaces.RealInput v "Voltage between pin p and n (= p.v - n.v) as input signal";
  Modelica.Units.SI.Current i "Current flowing from pin p to pin n";

equation
  // Voltage equation
  v = p.v - n.v;
  
  // Current conservation equation
  0 = p.i + n.i;
  
  // Current definition
  i = p.i;
end SignalVoltage;