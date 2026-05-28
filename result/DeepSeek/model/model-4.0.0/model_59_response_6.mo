model IdealOpAmp3Pin
  extends Modelica.Electrical.Analog.Interfaces.PartialOnePin;
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  Modelica.Electrical.Analog.Interfaces.PositivePin out;
equation 
  // Define the behavior of the operational amplifier
  in_p.v = in_n.v; // Balanced input voltages
  in_p.i = 0; // Zero input current
  in_n.i = 0; // Zero input current
  out.v = in_p.v; // Output voltage is equal to the positive input voltage
  out.i = 0; // Zero output current
end IdealOpAmp3Pin;