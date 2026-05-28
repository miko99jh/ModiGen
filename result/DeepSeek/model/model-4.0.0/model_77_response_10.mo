function convertAlpha
  extends Modelica.Icons.Function;
  input Modelica.Units.SI.LinearTemperatureCoefficient alpha1;
  input Modelica.Units.SI.Temperature T2;
  input Modelica.Units.SI.Temperature T1=293.15;
  output Modelica.Units.SI.LinearTemperatureCoefficient alpha2;
algorithm 
  alpha2 := alpha1 * (T2/T1);
end convertAlpha;