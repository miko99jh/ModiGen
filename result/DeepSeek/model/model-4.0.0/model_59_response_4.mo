model IdealOpAmp3Pin
  extends Modelica.Electrical.Analog.Basic.OnePort;
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  Modelica.Electrical.Analog.Interfaces.PositivePin out;
equation 
  // Define the behavior of the operational amplifier
  in_p.v = in_n.v; // Balanced input voltages
  in_p.i = in_n.i = 0; // Zero input currents
  // The output voltage is the difference between the input voltages
  out.v = in_p.v - in_n.v;
  // The output current is zero
  out.i = 0;
end IdealOpAmp3Pin;