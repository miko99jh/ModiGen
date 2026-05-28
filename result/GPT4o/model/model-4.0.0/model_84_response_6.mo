model VoltageSensor
 extends Modelica.Icons.RoundSensor;

  // Parameter for the number of phases
  parameter Integer m(final min=1) = 3;

  // Positive polyphase plug
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);

  // Negative polyphase plug
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m);

  // Real output for the voltage
  Modelica.Blocks.Interfaces.RealOutput v[m](each unit="V");

  // Array of voltage sensors
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor[m];

equation
  // Connect the voltage sensors to measure the potential difference
  for i in 1:m loop
    connect(voltageSensor[i].p, plug_p.pin[i]);
    connect(voltageSensor[i].n, plug_n.pin[i]);
    connect(voltageSensor[i].v, v[i]);
  end for;

end VoltageSensor;