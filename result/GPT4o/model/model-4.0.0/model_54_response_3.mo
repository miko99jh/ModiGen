model Subtracter
 extends Modelica.Icons.Example;

  // Parameters
  parameter Modelica.Units.SI.Voltage Vin = 5 "Amplitude of the input voltage";
  parameter Modelica.Units.SI.Frequency f = 10 "Frequency of the input voltage";

  // Components
  Modelica.Electrical.Analog.Basic.Ground ground "Ground connection";
  Modelica.Electrical.Analog.Sources.SineVoltage vIn1(V=Vin, freqHz=f) "Sinusoidal input voltage source";
  Modelica.Electrical.Analog.Sources.ConstantVoltage vIn2(V=Vin) "Constant input voltage source";
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut "Output voltage sensor";
  Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.Feedback feedback(i(p1_2) = 0) "Feedback loop for inverting subtracter";

equation
  // Connections
  connect(vIn1.p, feedback.p1) "Connect sinusoidal input to feedback input port p1";
  connect(vIn2.p, feedback.p1_2) "Connect constant input to feedback input port p1_2";
  connect(vIn1.n, ground.p) "Connect sinusoidal input return to ground";
  connect(vIn2.n, ground.p) "Connect constant input return to ground";
  connect(feedback.n1, ground.p) "Connect feedback input return to ground";
  connect(feedback.p2, vOut.n) "Connect feedback output positive terminal to voltage sensor negative terminal";
  connect(feedback.n2, vOut.p) "Connect feedback output negative terminal to voltage sensor positive terminal";
end Subtracter;