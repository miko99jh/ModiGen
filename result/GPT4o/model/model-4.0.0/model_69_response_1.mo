model Dd04
 extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final VectorGroup = "Dd04");

  // Parameters
  parameter Integer m = 3 "Number of phases";

  // Components
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m = m) "Primary delta connection";
  Modelica.Electrical.Polyphase.Basic.Delta Delta2(final m = m) "Secondary delta connection";

  // Connections
  equation
    // Primary side and leakage
    connect(r1.plug_p, Delta1.plug_p) "Connect primary input to first delta stage";
    connect(l1sigma.plug_n, core.plug_p1) "Connect primary leakage inductance to core winding 1 positive terminal";
    connect(Delta1.plug_n, core.plug_n1) "Connect delta return path to core winding 1 negative terminal";

    // Core inter-stage logic for Dd4 vector group
    connect(core.plug_n2, core.plug_p3) "Connect core winding 2 negative terminal to core winding 3 positive terminal";

    // Secondary side
    connect(core.plug_p2, Delta2.plug_p) "Connect core winding 2 positive terminal to second delta stage";
    connect(core.plug_n3, l2sigma.plug_n) "Connect core winding 3 negative terminal to secondary leakage inductance";
    connect(Delta2.plug_n, r2.plug_p) "Connect delta return path to output resistor terminal";

end Dd04;