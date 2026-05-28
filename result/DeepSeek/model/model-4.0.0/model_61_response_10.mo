model ConstantCurrent
 extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Modelica.Units.SI.Current I(start=1);
equation
  i = I;
end ConstantCurrent;