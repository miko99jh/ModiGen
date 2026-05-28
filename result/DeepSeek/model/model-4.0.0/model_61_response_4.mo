model ConstantCurrent
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Current I(start=1) "Value of constant current";
  Modelica.Electrical.Analog.Interfaces.PositivePlug p "Positive plug of source";
  Modelica.Electrical.Analog.Interfaces.NegativePlug n "Negative plug of source";

equation 
  i = I;
  v = p.v - n.v;
end ConstantCurrent;