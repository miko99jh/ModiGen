model Dy05 "Transformer Dy5"
  extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup="Dy05");
  Modelica.Electrical.Polyphase.Basic.Star star2(final m=m);
  Modelica.Electrical.Analog.Interfaces.NegativePin starpoint2;
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m=m);
equation
  connect(star2.pin_n, starpoint2);
  connect(Delta1.plug_p, r1.plug_p);
  connect(Delta1.plug_n, core.plug_n1);
  connect(l1sigma.plug_n, core.plug_p1);
  connect(core.plug_n2, core.plug_p3);
  connect(l2sigma.plug_n, core.plug_n3);
  connect(core.plug_p2, star2.plug_p);
end Dy05;
