model PlugToPins_p
 parameter Integer m(final min=1) = 3; // Number of phases

  // Positive plug interface for polyphase systems
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_p(final m=m);

  // Array of positive pins for analog connections
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p[m];

equation
  // Equate the voltage of each pin in the array with the corresponding voltage in the polyphase plug
  for i in 1:m loop
    pin_p[i].v = plug_p.pin[i].v;
  end for;

  // Ensure current conservation between the polyphase plug and the pin array
  for i in 1:m loop
    pin_p[i].i + plug_p.pin[i].i = 0;
  end for;
end PlugToPins_p;