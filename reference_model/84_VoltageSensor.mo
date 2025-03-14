model VoltageSensor "Polyphase voltage sensor"
  extends Modelica.Icons.RoundSensor;
  parameter Integer m(final min=1) = 3 "Number of phases";
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_n(final m=m);
  Modelica.Blocks.Interfaces.RealOutput v[m](each unit="V")
 "Voltage between pin p and n (= p.v - n.v) as output signal";
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor[m];
equation
  connect(voltageSensor.n, plug_n.pin);
  connect(voltageSensor.p, plug_p.pin);
  connect(voltageSensor.v, v);
end VoltageSensor;
