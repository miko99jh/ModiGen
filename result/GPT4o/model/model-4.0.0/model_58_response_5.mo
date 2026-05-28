model IdealGTOThyristor
 extends Modelica.Electrical.Analog.Interfaces.IdealSemiconductor;

  Modelica.Blocks.Interfaces.BooleanInput fire "Boolean input for firing the thyristor";

equation
  // The thyristor is off when the semiconductor state variable s is less than 0 or when the fire signal is false
  off = (s < 0) or not fire;
  
  // Additional equations can be added here to represent other behaviors or characteristics of the thyristor
end IdealGTOThyristor;