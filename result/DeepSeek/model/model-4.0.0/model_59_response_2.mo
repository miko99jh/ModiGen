model IdealOpAmp3Pin
  extends Modelica.Electrical.Analog.Interfaces.PartialTwoPin;

equation 
  // Define the behavior of the ideal operational amplifier
  in_p.v = in_n.v; // Balanced input voltages
  in_p.i = in_n.i = 0; // Zero input currents
end IdealOpAmp3Pin;