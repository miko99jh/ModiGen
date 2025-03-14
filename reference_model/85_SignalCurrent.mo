model SignalCurrent "Polyphase signal current source"
  parameter Integer m(min=1) = 3 "Number of phases";
  Modelica.Units.SI.Voltage v[m]=plug_p.pin.v - plug_n.pin.v
 "Voltage drops between the two plugs";
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m);
  Modelica.Blocks.Interfaces.RealInput i[m](each unit="A")
 "Current flowing from pin p to pin n as input signal";
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m];
equation
  connect(signalCurrent.p, plug_p.pin);
  connect(signalCurrent.n, plug_n.pin);
  connect(i, signalCurrent.i);
end SignalCurrent;
