model Short
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Integer m = 3 "Number of phases";
  Modelica.Electrical.Analog.Ideal.Short short[m];
equation 
  // Shortcut Path
  for i in 1:m loop
    connect(plug_p.pin[i], short[i].p);
    connect(short[i].n, plug_n.pin[i]);
  end for;
end Short;