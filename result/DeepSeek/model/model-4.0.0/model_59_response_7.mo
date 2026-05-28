model IdealOpAmp3Pin
  extends Modelica.Electrical.Analog.Basic.PositiveIdealVoltageSource;
  Modelica.Electrical.Analog.Interfaces.PositivePin in_p;
  Modelica.Electrical.Analog.Interfaces.NegativePin in_n;
  Modelica.Electrical.Analog.Interfaces.PositivePin out;
equation 
  // Voltage balance at the input pins
  in_p.v = in_n.v;
  // Zero current at the input pins
  in_p.i = 0;
  in_n.i = 0;
  // Voltage balance at the output pin
  out.v = in_p.v;
  // Zero current at the output pin
  out.i = 0;
end IdealOpAmp3Pin;