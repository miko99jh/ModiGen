model SignalCurrent
 parameter Integer m(min=1) = 3;
  Modelica.Units.SI.Voltage v[m] = plug_p.pin.v - plug_n.pin.v;
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m=m);
  Modelica.Blocks.Interfaces.RealInput i[m] "Current" each unit="A";
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m](i=i);
equation
  plug_p.pin.p = signalCurrent.i;
  plug_n.pin.n = signalCurrent.i;
end SignalCurrent;