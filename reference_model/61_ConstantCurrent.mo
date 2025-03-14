model ConstantCurrent "Source for constant current"
  parameter Modelica.Units.SI.Current I(start=1) "Value of constant current";
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Icons.CurrentSource;
equation
  i = I;
end ConstantCurrent;
