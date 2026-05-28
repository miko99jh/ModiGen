model PlugToPins_p
  parameter Integer m(final min=1) = 3 "Number of phases";
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m) annotation (Placement(transformation(extent={{-10,-10},{-10,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m] annotation (Placement(transformation(extent={{-10,-10},{-10,10}})));
equation 
  plug_p.v = pin_p.v;
  sum(pin_p.i) = -plug_p.i;
end PlugToPins_p;