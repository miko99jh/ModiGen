model IdealGTOThyristor
  extends Modelica.Electrical.Analog.Interfaces.IdealSemiconductor;
  Modelica.Blocks.Interfaces.BooleanInput fire;

equation
  // Thyristor is off when s < 0 or when fire signal is false
  off = s < 0 or not fire;
end IdealGTOThyristor;