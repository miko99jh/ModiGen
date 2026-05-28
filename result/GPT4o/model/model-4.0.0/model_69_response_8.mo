model Dd04
 extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup="Dd04");

  parameter Integer m = 3 "Number of phases";

  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m=m) "Primary side delta connection";
  Modelica.Electrical.Polyphase.Basic.Delta Delta2(final m=m) "Secondary side delta connection";

equation
  // Primary Side & Leakage
  connect(r1.plug_p, Delta1.plug_p);
  connect(l1sigma.plug_n, core.plug_p1);
  connect(Delta1.plug_n, core.plug_n1);

  // Core Inter-stage Logic
  connect(core.plug_n2, core.plug_p3);

  // Secondary Side
  connect(core.plug_p2, Delta2.plug_p);
  connect(core.plug_n3, l2sigma.plug_n);
  connect(Delta2.plug_n, r2.plug_p);

end Dd04;