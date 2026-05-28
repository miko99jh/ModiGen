model IdealCore
  extends Modelica.Electrical.Machines.Interfaces.PartialCore;
  parameter Real n12=1 "Voltage transformation ratio 1->2";
  parameter Real n13=1 "Voltage transformation ratio 1->3";
  parameter Integer m=3 "Number of phases";
  Modelica.Electrical.Analog.Basic.Impedance z_m[m](V(start=1), I(start=0)) 
    "Magnetizing impedance";
  Modelica.Electrical.Analog.Basic.Impedance z_1[m](V(start=1), I(start=0)) 
    "Primary winding impedance";
  Modelica.Electrical.Analog.Basic.Impedance z_2[m](V(start=1), I(start=0)) 
    "Secondary winding impedance";
  Modelica.Electrical.Analog.Basic.Impedance z_3[m](V(start=1), I(start=0)) 
    "Tertiary winding impedance";
  Modelica.Electrical.Analog.Basic.CurrentSource i_m[m](I(start=0)) 
    "Magnetizing current source";
  Modelica.Electrical.Analog.Basic.CurrentSource i_1[m](I(start=0)) 
    "Primary winding current source";
  Modelica.Electrical.Analog.Basic.CurrentSource i_2[m](I(start=0)) 
    "Secondary winding current source";
  Modelica.Electrical.Analog.Basic.CurrentSource i_3[m](I(start=0)) 
    "Tertiary winding current source";
  Modelica.Electrical.Analog.Basic.VoltageSourceVariable v_1[m](V(start=1)) 
    "Primary winding voltage source";
  Modelica.Electrical.Analog.Basic.VoltageSourceVariable v_2[m](V(start=1)) 
    "Secondary winding voltage source";
  Modelica.Electrical.Analog.Basic.VoltageSourceVariable v_3[m](V(start=1)) 
    "Tertiary winding voltage source";
  Modelica.Electrical.Analog.Basic.Ground g[m] "Grounded terminals";
equation 
  // magnetizing current
  for i=1:m loop
    i_m[i].I = zeros(m);
  end for;
  // voltage transformation ratios
  v1 = n12 * v2;
  v1 = n13 * v3;
end IdealCore;