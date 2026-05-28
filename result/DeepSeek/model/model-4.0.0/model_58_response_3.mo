model IdealGTOThyristor
  extends Modelica.Electrical.Analog.Interfaces.IdealSemiconductor;
  Modelica.Blocks.Interfaces.BooleanInput fire;

equation
  // Define the state of the thyristor
  off = s < 0 or not fire;
end IdealGTOThyristor;