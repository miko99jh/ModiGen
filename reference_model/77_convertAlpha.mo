function convertAlpha
  "Converts alpha from temperature 1 (default 20 degC) to temperature 2"
  extends Modelica.Icons.Function;
  input Modelica.Units.SI.LinearTemperatureCoefficient alpha1
 "Temperature coefficient at temperature 1 (default: 20 degC)";
  input Modelica.Units.SI.Temperature T2 "Temperature 2";
  input Modelica.Units.SI.Temperature T1=293.15
 "Temperature 1 (default: 20 degC)";
  output Modelica.Units.SI.LinearTemperatureCoefficient alpha2
 "Temperature coefficient at TRef";
algorithm
  alpha2 := alpha1/(1 + alpha1*(T2 - T1));
end convertAlpha;
