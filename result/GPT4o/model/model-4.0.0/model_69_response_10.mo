model Dd04
 extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup="Dd04");

  // Parameters
  parameter Integer m = 3 "Number of phases";

  // Components
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m=m) "Primary side delta connection";
  Modelica.Electrical.Polyphase.Basic.Delta Delta2(final m=m) "Secondary side delta connection";

equation
  // Primary Side & Leakage
  connect(r1.plug_p, Delta1.plug_p) "Connect primary input to first delta stage";
  connect(l1sigma.plug_n, core.plug_p1) "Connect primary leakage inductance to core's first winding positive input";
  connect(Delta1.plug_n, core.plug_n1) "Complete primary loop by connecting delta's return path to core's first winding negative terminal";

  // Core Inter-stage Logic
  connect(core.plug_n2, core.plug_p3) "Bridge internal core windings for Dd4 phase-shift topology";

  // Secondary Side
  connect(core.plug_p2, Delta2.plug_p) "Link core's secondary output to second delta stage";
  connect(core.plug_n3, l2sigma.plug_n) "Route third winding's return to secondary leakage inductance";
  connect(Delta2.plug_n, r2.plug_p) "Close circuit by connecting delta's return path to output resistor terminal";

end Dd04;