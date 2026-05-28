model IdealGTOThyristor
  extends Modelica.Electrical.Analog.Interfaces.IdealSemiconductor;
  Modelica.Blocks.Interfaces.BooleanInput fire;
  Boolean off = s < 0 or not fire;
equation
  // Equations for an ideal GTO thyristor
  //...
end IdealGTOThyristor;