model IdealCore
  extends Modelica.Electrical.Machines.Interfaces.PartialCore;
  parameter Real n12 = 1 "Voltage transformation ratio 1->2";
  parameter Real n13 = 1 "Voltage transformation ratio 1->3";
  Modelica.Electrical.Analog.Basic.Impedance z(R=0, L=0) 
    "Transformer core impedance";
  Modelica.Electrical.Analog.Basic.Inductor l1(L=1e-3) 
    "Primary winding inductance";
  Modelica.Electrical.Analog.Basic.Inductor l2(L=1e-3) 
    "Secondary winding 2 inductance";
  Modelica.Electrical.Analog.Basic.Inductor l3(L=1e-3) 
    "Secondary winding 3 inductance";
  Modelica.Electrical.Analog.Basic.CurrentSource i1(i=im) 
    "Primary winding magnetizing current";
  Modelica.Electrical.Analog.Basic.CurrentSource i2(i=zeros(m)) 
    "Secondary winding 2 magnetizing current";
  Modelica.Electrical.Analog.Basic.CurrentSource i3(i=zeros(m)) 
    "Secondary winding 3 magnetizing current";
equation 
  // Voltage transformation ratios
  v1 = n12 * v2;
  v1 = n13 * v3;
  // Magnetizing currents
  im = zeros(m);
  // Winding inductances
  l1.i = i1.i;
  l2.i = i2.i;
  l3.i = i3.i;
  // Core impedance
  z.i = i1.i;
end IdealCore;