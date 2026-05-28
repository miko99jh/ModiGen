model PlugToPins_p
  parameter Integer m(final min=1) = 3;
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m];
equation 
  plug_p.v = Modelica.Electrical.Polyphase.Utilities.potentialVector(m, pin_p);
  Modelica.Electrical.Polyphase.Utilities.currentVector(m, pin_p) = -plug_p.i;
end PlugToPins_p;