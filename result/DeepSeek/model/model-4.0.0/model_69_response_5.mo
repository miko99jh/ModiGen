model Dd04
  extends Modelica.Electrical.Machines.Interfaces.PartialBasicTransformer(final vectorGroup = Modelica.Electrical.Machines.Types.VectorGroup.Dd04);
  Modelica.Electrical.Polyphase.Basic.Delta Delta1(final m = m);
  Modelica.Electrical.Polyphase.Basic.Delta Delta2(final m = m);
  Modelica.Electrical.Analog.Basic.Inductor l1sigma(L = 1e-3);
  Modelica.Electrical.Analog.Basic.Inductor l2sigma(L = 1e-3);
  Modelica.Electrical.Analog.Basic.Resistor r2(R = 1);
equations 
  // Primary Side & Leakage
  connect(r1.plug_p, Delta1.plug_p);
  connect(l1sigma.plug_n, core.plug_p1);
  connect(Delta1.plug_n, core.plug_n1);
  
  // Core Inter-stage Logic
  connect(core.plug_n2, core.plug_p3);
  
  // Secondary Side
  connect(core.plug_p2, Delta2.plug_p);
  connect(l2sigma.plug_n, core.plug_n3);
  connect(Delta2.plug_n, r2.plug_p);
end Dd04;