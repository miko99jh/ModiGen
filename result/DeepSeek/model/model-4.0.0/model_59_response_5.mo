model IdealOpAmp3Pin
  extends Modelica.Electrical.Analog.Basic.PositiveIdealVoltageSource(
    V=in_p.v - in_n.v);
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  Modelica.Electrical.Analog.Interfaces.PositivePin out;
equation 
  // Voltage at positive input pin is equal to the voltage at negative input pin
  in_p.v = in_n.v;
  // Current at both positive input pin and negative input pin is zero
  in_p.i = 0;
  in_n.i = 0;
end IdealOpAmp3Pin;