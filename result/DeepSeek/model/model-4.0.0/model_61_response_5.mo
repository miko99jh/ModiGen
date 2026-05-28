model ConstantCurrent
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Current I(start=1) "Constant current";
  Modelica.Electrical.Analog.Interfaces.PositivePlug p "Positive plug of current source";
  Modelica.Electrical.Analog.Interfaces.NegativePlug n "Negative plug of current source";

equation 
  i = I;

  annotation (
    uses(Modelica(version="3.2.3")),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-10, -10}, {10, 10}}), graphics={
      Rectangle(lineColor={0, 0, 0}, fillColor={0.75, 0.75, 0.75}, lineThickness=0.5, extent={{-10, -10}, {10, 10}}),
      Text(text="I=" & string(I), lineColor={0, 0, 0}, fillColor={0.75, 0.75, 0.75}, lineThickness=0.5, extent={{-10, -10}, {10, 10}}, origin={0, 0}, fontSize=14, font="Arial"),
      Line(lineColor={0, 0, 0}, lineThickness=0.5, points={{-5, -5}, {5, 5}}),
      Line(lineColor={0, 0, 0}, lineThickness=0.5, points={{-5, 5}, {5, -5}})
    }),
    Palette(position={100, 100}, components=Record(components={Modelica.Electrical.Analog.Interfaces.PositivePlug, Modelica.Electrical.Analog.Interfaces.NegativePlug})),
    Documentation(info="Constant current source")
  );
end ConstantCurrent;