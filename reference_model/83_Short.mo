model Short "Polyphase short cut branch"
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  Modelica.Electrical.Analog.Ideal.Short short[m] ;
equation
  connect(plug_p.pin, short.p);
  connect(short.n, plug_n.pin);
end Short;
