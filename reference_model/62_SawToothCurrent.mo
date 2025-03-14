model SawToothCurrent "Saw tooth current source"
  parameter Modelica.Units.SI.Current I(start=1) "Amplitude of saw tooth";
  parameter Modelica.Units.SI.Time period(start=1) "Time for one period";
  extends Modelica.Electrical.Analog.Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.SawTooth
 signalSource(final amplitude=I, final period=period));
end SawToothCurrent;
