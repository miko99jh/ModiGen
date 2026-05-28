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
  // Connect the positive terminals of the sensor array to the internal pins of the positive plug
  for i in 1:m loop
    connect(voltageSensor[i].p, plug_p.pin[i]);
  end for;

  // Connect the negative terminals of the sensor array to the internal pins of the negative plug
  for i in 1:m loop
    connect(voltageSensor[i].n, plug_n.pin[i]);
  end for;

  // Route the measured voltage signal from each sensor to the corresponding element in the block's output vector
  for i in 1:m loop
    v[i] = voltageSensor[i].v;
  end for;

end VoltageSensor;