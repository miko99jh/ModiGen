model IdealOpAmp3Pin
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
equation 
  in_p.v = in_n.v; // Voltage at positive input pin is equal to the voltage at negative input pin
  in_p.i = in_n.i = 0; // Current at both positive input pin and negative input pin is zero
end IdealOpAmp3Pin;