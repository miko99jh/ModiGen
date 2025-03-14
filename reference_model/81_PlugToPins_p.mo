model PlugToPins_p "Connect all (positive) Pins"
  parameter Integer m(final min=1) = 3 "Number of phases";
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m) ;
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m];
equation
  pin_p.v = plug_p.pin.v;
  plug_p.pin.i = -pin_p.i;
end PlugToPins_p;
