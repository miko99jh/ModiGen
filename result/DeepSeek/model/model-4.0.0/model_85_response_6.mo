model SignalCurrent
  parameter Integer m(min=1) = 3;
  Modelica.Units.SI.Voltage v[m] = plug_p.pin.v - plug_n.pin.v;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m);
  Modelica.Blocks.Interfaces.RealInput i[m] "Current" each unit="A";
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m](i=i);
equation 
  for i in 1:m loop
    plug_p.pin.i[i] = signalCurrent[i].i;
    plug_n.pin.i[i] = -signalCurrent[i].i;
  end for;
end SignalCurrent;