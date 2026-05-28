model ConstantCurrent
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Current I(start=1) "Value of constant current";
  Modelica.Electrical.Analog.Interfaces.PositivePlug p "Positive plug of source";
  Modelica.Electrical.Analog.Interfaces.NegativePlug n "Negative plug of source";

equation 
  i = I;

  annotation (
    Icon(graphics={
      Icon.Graphics(
        type = Icon.Graphics.Ellipse,
        extent = {{-50, -50}, {50, 50}},
        fillColor = {0.9, 0.9, 0.9},
        lineColor = {0, 0, 0},
        lineThickness = 0.5
      ),
      Icon.Graphics(
        type = Icon.Graphics.Text,
        extent = {{-50, 50}, {50, 70}},
        textString = "I",
        fontSize = 20,
        fontColor = {0, 0, 0}
      )
    }),
    uses(Modelica(version="3.2.3"))
  );
end ConstantCurrent;