model IdealOpAmp3Pin
  extends Modelica.Electrical.Analog.Basic.VCVS;
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  Modelica.Electrical.Analog.Interfaces.PositivePin out;
equation 
  // Define the behavior of the ideal operational amplifier
  in_p.v = in_n.v; // Balanced input voltages
  in_p.i = in_n.i = 0; // Zero input currents
end IdealOpAmp3Pin;