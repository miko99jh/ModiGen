model ConstantCurrent
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Icons.CurrentSource;

  parameter Modelica.Units.SI.Current I(start=1) "Constant current";

  equation
    i = I;
end ConstantCurrent;