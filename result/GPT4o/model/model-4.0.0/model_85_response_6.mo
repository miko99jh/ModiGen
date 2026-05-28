model SignalCurrent
 parameter Integer m(min=1) = 3 "Number of phases";

  // Positive polyphase plug
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);

  // Negative polyphase plug
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m);

  // Voltage drops between the two plugs
  Modelica.Units.SI.Voltage v[m] = plug_p.pin.v - plug_n.pin.v;

  // Real input for the current
  Modelica.Blocks.Interfaces.RealInput i[m](each unit="A");

  // Array of signal current sources
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m];

equation
  // Signal Routing: Route each element of the external input signal vector 'i' to the corresponding control input ('i') of the 'signalCurrent' array.
  for phase in 1:m loop
    signalCurrent[phase].i = i[phase];
  end for;

  // Electrical Connection: Connect the current source array between the plugs
  for phase in 1:m loop
    connect(signalCurrent[phase].p, plug_p.pin[phase]);
    connect(signalCurrent[phase].n, plug_n.pin[phase]);
  end for;
end SignalCurrent;