model SawToothCurrent
 extends Modelica.Electrical.Analog.Interfaces.CurrentSource;

  parameter Modelica.Units.SI.Current I = 1 "Amplitude of saw tooth";
  parameter Modelica.Units.SI.Time period = 1 "Time for one period";

  redeclare final Modelica.Blocks.Sources.SawTooth signalSource(
    final amplitude = I,
    final period = period) "Saw tooth waveform generator";

equation
  // The current source is driven by the saw tooth signal
  i = signalSource.y;
end SawToothCurrent;