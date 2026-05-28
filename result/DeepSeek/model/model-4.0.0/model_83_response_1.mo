model Short
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Integer m = 3 "Number of phases";
  Modelica.Electrical.Analog.Ideal.Short short[m];
equation 
  // Shortcut Path
  for i in 1:m loop
    plug_p.pin[i].p = short[i].p;
    short[i].n = plug_n.pin[i].n;
  end for;
end Short;