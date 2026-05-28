model SignalCurrent
  parameter Integer m(min=1) = 3;
  Modelica.Units.SI.Voltage v[m] = plug_p.pin.v - plug_n.pin.v;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelical.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m);
  Modelica.Blocks.Interfaces.RealInput i[m](each unit="A");
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m](re=i);
equation
  for i in 1:m loop
    signalCurrent[i].i = i;
    signalCurrent[i].p = plug_p.pin_p[i];
    signalCurrent[i].n = plug_n.pin_n[i];
  end for;
end SignalCurrent;