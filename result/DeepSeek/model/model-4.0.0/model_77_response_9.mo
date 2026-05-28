function convertAlpha
  extends Modelica.Icons.Function;
  input Modelica.Units.SI.LinearTemperatureCoefficient alpha1 "Linear temperature coefficient at temperature 1";
  input Modelica.Units.SI.Temperature T2 "Temperature 2";
  input Modelica.Units.SI.Temperature T1=293.15 "Temperature 1";
  output Modelica.Units.SI.LinearTemperatureCoefficient alpha2 "Linear temperature coefficient at temperature 2";
algorithm 
  alpha2 := alpha1 * (T2/T1);
end convertAlpha;