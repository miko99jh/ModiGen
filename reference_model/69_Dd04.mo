model Dd04 "Transformer Dd4"
  extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup="Dd04");
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m=m);
  Modelica.Electrical.Polyphase.Basic.Delta Delta2(final m=m);
equation
  connect(r1.plug_p, Delta1.plug_p);
  connect(Delta2.plug_n, r2.plug_p);
  connect(l1sigma.plug_n, core.plug_p1);
  connect(Delta1.plug_n, core.plug_n1);
  connect(core.plug_n2, core.plug_p3);
  connect(core.plug_p2, Delta2.plug_p);
  connect(core.plug_n3, l2sigma.plug_n);
end Dd04;
