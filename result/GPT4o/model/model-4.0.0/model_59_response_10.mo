model IdealOpAmp3Pin
 // Positive input pin
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  
  // Negative input pin
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  
  // Output pin
  Modelica.Electrical.Analog.Interfaces.PositivePin out;

equation
  // Voltage at positive input equals voltage at negative input
  in_p.v = in_n.v;
  
  // Current at positive input is zero
  in_p.i = 0;
  
  // Current at negative input is zero
  in_n.i = 0;
  
  // Output current is not defined for an ideal op-amp model
  // The output voltage is not constrained in an ideal op-amp model
  // It is determined by the external circuit connected to the op-amp
end IdealOpAmp3Pin;