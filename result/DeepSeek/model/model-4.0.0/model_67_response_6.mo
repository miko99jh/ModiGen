model IdealCore
  extends Modelica.Electrical.Machines.Interfaces.PartialCore;
  parameter Integer m=3 "Number of phases";
  parameter Real n12=1 "Voltage transformation ratio winding 1 to winding 2";
  parameter Real n13=1 "Voltage transformation ratio winding 1 to winding 3";
  Modelica.Electrical.Analog.Basic.Impedance z_m[m](R=0, L=0) 
    "Magnetizing impedance";
  Modelica.Electrical.Analog.Basic.Impedance z_l[m](R=0, L=0) 
    "Leakage impedance";
  Modelica.Electrical.Analog.Basic.Impedance z_c[m](R=0, L=0) 
    "Core impedance";
  Modelica.Electrical.Analog.Basic.Impedance z_g[m](R=0, L=0) 
    "Ground impedance";
  Modelica.Electrical.Analog.Basic.CurrentSource i_m[m](I=zeros(m)) 
    "Magnetizing current source";
  Modelica.Electrical.Analog.Basic.VoltageSource v_s[m] 
    "Voltage source";
  Modelica.Electrical.Analog.Basic.Current i_l[m] 
    "Leakage current";
  Modelica.Electrical.Analog.Basic.Current i_c[m] 
    "Core current";
  Modelica.Electrical.Analog.Basic.Current i_g[m] 
    "Ground current";
  Modelica.Electrical.Analog.Basic.Voltage v_1[m] 
    "Voltage winding 1";
  Modelica.Electrical.Analog.Basic.Voltage v_2[m] 
    "Voltage winding 2";
  Modelica.Electrical.Analog.Basic.Voltage v_3[m] 
    "Voltage winding 3";
  Modelica.Electrical.Analog.Basic.Current i_1[m] 
    "Current winding 1";
  Modelica.Electrical.Analog.Basic.Current i_2[m] 
    "Current winding 2";
  Modelica.Electrical.Analog.Basic.Current i_3[m] 
    "Current winding 3";
equation 
  // Equations for the ideal transformer
  v1 = n12 * v2;
  v1 = n13 * v3;
  // Equations for the magnetizing current
  im = zeros(m);
  // Equations for the voltage and current relations
  v_1 = z_m * i_m + z_l * i_l + z_c * i_c + z_g * i_g;
  v_2 = z_m * i_m + z_l * i_l + z_c * i_c + z_g * i_g;
  v_3 = z_m * i_m + z_l * i_l + z_c * i_c + z_g * i_g;
  i_1 = v_1 / z_m;
  i_2 = v_2 / z_m;
  i_3 = v_3 / z_m;
  // Equations for the voltage and current sources
  v_s = i_m * z_m + i_l * z_l + i_c * z_c + i_g * z_g;
  i_l = v_s / z_l;
  i_c = v_s / z_c;
  i_g = v_s / z_g;
end IdealCore;