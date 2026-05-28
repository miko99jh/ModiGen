model ConstantCurrent
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Current I(start=1) "Constant current";
  Modelica.SIunits.Current i;
equation 
  i = I;
  v = -i*R;
  annotation (
    Icon(graphics={
      Rectangle(
        extent = {{-10, -10}, {10, 10}},
        lineColor = {0, 0, 0},
        fillColor = {0.7, 0.7, 0.7}
      ),
      Text(
        text = "I=" & String(I),
        extent = {{-10, -20}, {10, 10}},
        lineColor = {0, 0, 0},
        fillColor = {1, 1, 1}
      )
    }),
    uses(Modelica(version="3.2.3"))
  );
end ConstantCurrent;