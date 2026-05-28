model Short
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Integer m=3 "Number of phases";
  Modelica.Electrical.Analog.Ideal.Short short[m];
equation 
  // Shortcut Path
  plug_p.pin[1:m] = short[1:m].p;
  // Circuit Completion
  short[1:m].n = plug_n.pin[1:m];
end Short;