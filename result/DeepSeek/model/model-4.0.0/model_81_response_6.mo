model PlugToPins_p
  parameter Integer m(final min=1) = 3;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(m=m);
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m];
equation
  plug_p.v = pin_p.v;
  sum(pin_p.i) = -sum(plug_p.i);
end PlugToPins_p;