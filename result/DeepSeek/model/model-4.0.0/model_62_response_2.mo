model SawToothCurrent
  extends Modelica.Electrical.Analog.Interfaces.CurrentSource;
  Modelica.Blocks.Sources.SawTooth signalSource(
    final amplitude = I,
    final period = period
  );
equation
  i = signalSource.y;
end SawToothCurrent;