model VoltageSensor
  extends Modelica.Icons.RoundSensor;
  parameter Integer m(final min=1) = 3;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m);
  Modelica.Blocks.Interfaces.RealOutput v[m] "Voltage" each unit="V";
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor[m];
equation 
  connect(voltageSensor.p, plug_p.pin);
  connect(voltageSensor.n, plug_n.pin);
  for i in 1:m loop
    v[i] = voltageSensor[i].v;
  end for;
end VoltageSensor;