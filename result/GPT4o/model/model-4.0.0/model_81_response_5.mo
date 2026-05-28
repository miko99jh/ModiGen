model PlugToPins_p
 parameter Integer m(final min=1) = 3;

  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m];

equation
  // Potential Equality: Equate the voltage of each pin in pin_p with the corresponding voltage in plug_p
  for i in 1:m loop
    pin_p[i].v = plug_p.pin[i].v;
  end for;

  // Current Conservation: The sum of currents entering the plug_p should equal the sum of currents leaving pin_p
  for i in 1:m loop
    plug_p.pin[i].i + pin_p[i].i = 0;
  end for;
end PlugToPins_p;