model Subtracter
 extends Modelica.Icons.Example;

  // Parameters
  parameter Modelica.Units.SI.Voltage Vin = 5 "Amplitude of the input voltage";
  parameter Modelica.Units.SI.Frequency f = 10 "Frequency of the input voltage";

  // Components
  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Sources.SineVoltage vIn1(V = Vin, f = f) "Sinusoidal input voltage source";
  Modelica.Electrical.Analog.Sources.ConstantVoltage vIn2(V = Vin) "Constant input voltage source";
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut "Output voltage sensor";
  Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.Feedback feedback(i(p1_2) = 0) "Feedback loop";

equation
  // Connections
  connect(vIn1.p, feedback.p1) "Connect vIn1 positive to feedback input p1";
  connect(vIn2.p, feedback.p1_2) "Connect vIn2 positive to feedback input p1_2";
  connect(vIn1.n, ground.p) "Connect vIn1 negative to ground";
  connect(vIn2.n, ground.p) "Connect vIn2 negative to ground";
  connect(feedback.n1, ground.p) "Connect feedback input n1 to ground";
  connect(feedback.p2, vOut.n) "Connect feedback output p2 to vOut negative terminal";
  connect(feedback.n2, vOut.p) "Connect feedback output n2 to vOut positive terminal";

end Subtracter;