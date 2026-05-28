model SawToothCurrent
  extends Modelica.Electrical.Analog.Interfaces.CurrentSource;
  parameter Modelica.Units.SI.Current I(start=1) "Amplitude of saw tooth";
  parameter Modelica.Units.SI.Time period(start=1) "Time for one period";
  Modelica.Blocks.Sources.SawTooth signalSource(final amplitude=I, final period=period);
equation 
  i = signalSource.y;
end SawToothCurrent;