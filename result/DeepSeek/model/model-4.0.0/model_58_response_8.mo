model IdealGTOThyristor
  extends Modelica.Electrical.Analog.Interfaces.IdealSemiconductor;
  Modelica.Blocks.Interfaces.BooleanInput fire;

equation 
  // The thyristor is off when the semiconductor state variable s is less than 0 or when the fire signal is false
  off = (s < 0) or not fire;

  // The equations for an ideal GTO thyristor
  //...

end IdealGTOThyristor;