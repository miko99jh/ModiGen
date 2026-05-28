model ConstantCurrent
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Current I(start=1) "Constant current";
  Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive pin";
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative pin";

equation 
  i = I;
end ConstantCurrent;