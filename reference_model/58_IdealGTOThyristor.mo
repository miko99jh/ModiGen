model IdealGTOThyristor "Ideal GTO thyristor"
  extends Modelica.Electrical.Analog.Interfaces.IdealSemiconductor;
  Modelica.Blocks.Interfaces.BooleanInput fire;
equation
  off = s < 0 or not fire;
end IdealGTOThyristor;
