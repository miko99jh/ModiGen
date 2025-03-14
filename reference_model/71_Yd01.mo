model Yd01 "Transformer Yd1"
  extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup="Yd01");
  Modelica.Electrical.Polyphase.Basic.Star star1(final m=m);
  Modelica.Electrical.Analog.Interfaces.NegativePin starpoint1;
  Modelica.Electrical.Polyphase.Basic.Delta Delta2(final m=m);
equation
  connect(star1.pin_n, starpoint1);
  connect(Delta2.plug_p, r2.plug_p);
  connect(l1sigma.plug_n, core.plug_p1);
  connect(core.plug_n1, star1.plug_p);
  connect(core.plug_n2, core.plug_p3);
  connect(core.plug_n3, Delta2.plug_n);
  connect(core.plug_p2, l2sigma.plug_n);
end Yd01;
