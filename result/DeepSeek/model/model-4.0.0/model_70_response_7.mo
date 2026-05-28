model Dy05
  extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final vectorGroup = Modelica.Electrical.Machines.Types.VectorGroup.Dy05);
  Modelica.Electrical.Polyphase.Basic.Star star2(final m = m);
  Modelica.Electrical.Analog.Interfaces.NegativePin starpoint2;
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m = m);

equation 
  // Primary Loop
  r1.plug_p = Delta1.plug_p;
  l1sigma.plug_n = core.plug_p1;
  Delta1.plug_n = core.plug_n1;

  // Vector Group Bridge
  core.plug_n2 = core.plug_p3;

  // Secondary Star Topology
  core.plug_p2 = star2.plug_p;

  // Secondary Leakage & Neutral
  l2sigma.plug_n = core.plug_n3;
  star2.pin_n = starpoint2;
end Dy05;