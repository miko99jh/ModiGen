model IdealOpAmp3Pin
 // Positive input pin
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  
  // Negative input pin
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  
  // Output pin
  Modelica.Electrical.Analog.Interfaces.PositivePin out;

equation
  // Voltage at positive input pin equals voltage at negative input pin
  in_p.v = in_n.v;
  
  // Current at positive input pin is zero
  in_p.i = 0;
  
  // Current at negative input pin is zero
  in_n.i = 0;
  
  // Output pin is a norator, allowing any voltage and current
  // No specific equation for out.v and out.i, as they are determined by the connected circuit
end IdealOpAmp3Pin;