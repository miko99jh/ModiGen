model PlugToPins_p
  parameter Integer m(final min=1) = 3;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m) annotation (Placement(transformation(extent={{-10,-10},{-10,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m] annotation (Placement(transformation(extent={{10,-10},{10,10}})));
equation 
  plug_p.v = pin_p.v;
  sum(pin_p.i) + sum(pin_p.i) = 0;
end PlugToPins_p;