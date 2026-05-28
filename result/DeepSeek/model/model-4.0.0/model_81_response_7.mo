model PlugToPins_p
  parameter Integer m(final min=1) = 3;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m];
equation
  // Potential Equality
  for i in 1:m loop
    plug_p.v[i] = pin_p[i].v;
  end for;

  // Current Conservation
  for i in 1:m loop
    plug_p.i[i] = -pin_p[i].i;
  end for;
end PlugToPins_p;