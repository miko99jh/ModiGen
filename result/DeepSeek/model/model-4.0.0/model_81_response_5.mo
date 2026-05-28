model PlugToPins_p
  parameter Integer m(final min=1) = 3 "Number of phases";
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(transformation(extent={{-10,-10},{-10,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m] annotation(Placement(transformation(extent={{-10,-10},{-10,10}})));
equation 
  for i in 1:m loop
    plug_p.v[i] = pin_p[i].v;
    pin_p[i].i = -plug_p.i[i];
  end for;
end PlugToPins_p;