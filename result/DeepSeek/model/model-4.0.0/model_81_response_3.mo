model PlugToPins_p
  parameter Integer m(final min=1) = 3;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m];
equation
  // Potential Equality
  plug_p.v = pin_p.v;
  // Current Conservation
  sum(pin_p.i) = -sum(plug_p.i);
end PlugToPins_p;