model IdealOpAmp3Pin
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  Modelica.Electrical.Analog.Interfaces.PositivePin out;
equation 
  // Voltage at the positive input pin is equal to the voltage at the negative input pin
  in_p.v = in_n.v;
  
  // Current at both the positive input pin and the negative input pin is zero
  in_p.i = 0;
  in_n.i = 0;
  
  // Voltage at the output pin is equal to the voltage at the positive input pin
  out.v = in_p.v;
  
  // Current at the output pin is zero
  out.i = 0;
end IdealOpAmp3Pin;