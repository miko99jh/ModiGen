model SignalCurrent
  parameter Integer m(min=1) = 3 "Number of phases";
  Modelica.Units.SI.Voltage v[m] = plug_p.pin.v - plug_n.pin.v "Voltage drops between the two plugs";
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m) "Positive polyphase plug";
  Modelical.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m) "Negative polyphase plug";
  Modelica.Blocks.Interfaces.RealInput i[m] "Real input for the current";
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m](i=i) "Array of signal current sources";
equation 
  for i in 1:m loop
    plug_p.pin.i[i] = signalCurrent[i].i[i];
    plug_n.pin.i[i] = -signalCurrent[i].i[i];
  end for;
end SignalCurrent;