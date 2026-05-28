model Short
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Integer m=3 "Number of phases";
  Modelica.Electrical.Analog.Ideal.Short short[m];
equation 
  for i in 1:m loop
    short[i].p = plug_p.pin[i];
    short[i].n = plug_n.pin[i];
  end for;
end Short;