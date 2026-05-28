model Dy05
 extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup="Dy05");

  // Components
  Modelica.Electrical.Polyphase.Basic.Star star2(final m=m) "Star connection for secondary winding";
  Modelica.Electrical.Analog.Interfaces.NegativePin starpoint2 "Negative pin for star point";
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m=m) "Delta connection for primary winding";

equation
  // Connections

  // Primary Loop
  connect(r1.plug_p, Delta1.plug_p) "Connect primary source to Delta connection";
  connect(l1sigma.plug_n, core.plug_p1) "Connect primary leakage to core primary entry";
  connect(Delta1.plug_n, core.plug_n1) "Close primary delta circuit";

  // Vector Group Bridge
  connect(core.plug_n2, core.plug_p3) "Implement Dy5 phase shift";

  // Secondary Star Topology
  connect(core.plug_p2, star2.plug_p) "Route transformed power to star connection";

  // Secondary Leakage & Neutral
  connect(l2sigma.plug_n, core.plug_n3) "Connect secondary leakage to core secondary return";
  connect(star2.pin_n, starpoint2) "Establish system neutral";

end Dy05;