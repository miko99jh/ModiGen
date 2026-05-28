model Yd01
  extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup = "Yd01");
  Modelica.Electrical.Polyphase.Basic.Star star1(m = m);
  Modelica.Electrical.Analog.Interfaces.NegativePin starpoint1;
  Modelica.Electrical.Polyphase.Basic.Delta Delta2(m = m);
equation 
  connect(star1.pin_n, starpoint1) "Primary Star & Neutral";
  connect(l1sigma.plug_n, star1.plug_p) "Primary Winding Path";
  connect(core.plug_n1, star1.plug_p) "Primary Winding Path";
  connect(core.plug_p1, l1sigma.plug_p) "Primary Winding Path";
  connect(core.plug_p2, l2sigma.plug_p) "Secondary Delta & Leakage";
  connect(core.plug_n2, core.plug_p3) "Vector Group Bridge";
  connect(core.plug_n3, Delta2.plug_n) "Secondary Delta & Leakage";
  connect(Delta2.plug_p, r2.plug_p) "Secondary Delta & Leakage";
end Yd01;