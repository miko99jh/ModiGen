model Short
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Integer m=3 "Number of phases";
  Modelica.Electrical.Analog.Ideal.Short short[m];
equation 
  // Shortcut Path
  for i in 1:m loop
    plug_p.pin[i].p = short[i].p;
    plug_n.pin[i].p = short[i].n;
  end for;
  // Circuit Completion
  for i in 1:m loop
    plug_p.pin[i].n = short[i].p;
    plug_n.pin[i].n = short[i].n;
  end for;
end Short;