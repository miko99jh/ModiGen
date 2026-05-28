model VoltageSensor
 extends Modelica.Icons.RoundSensor;

  parameter Integer m(final min=1) = 3 "Number of phases";

  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m) "Positive polyphase plug";
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m) "Negative polyphase plug";

  Modelica.Blocks.Interfaces.RealOutput v[m](each unit="V") "Measured voltage output";

  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor[m] "Array of voltage sensors";

equation
  for i in 1:m loop
    connect(voltageSensor[i].p, plug_p.pin[i]);
    connect(voltageSensor[i].n, plug_n.pin[i]);
    v[i] = voltageSensor[i].v;
  end for;

end VoltageSensor;