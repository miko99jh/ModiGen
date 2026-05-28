model Dy05
  extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final vectorGroup = Modelica.Electrical.Machines.Types.VectorGroup.Dy05);
  Modelica.Electrical.Polyphase.Basic.Star star2(final m = m);
  Modelica.Electrical.Analog.Interfaces.NegativePin starpoint2;
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m = m);
equation 
  connect(r1.plug_p, Delta1.plug_p);
  connect(l1sigma.plug_n, core.plug_p1);
  connect(Delta1.plug_n, core.plug_n1);
  connect(core.plug_n2, core.plug_p3);
  connect(core.plug_p2, star2.plug_p);
  connect(l2sigma.plug_n, core.plug_n3);
  connect(star2.pin_n, starpoint2);
end Dy05;