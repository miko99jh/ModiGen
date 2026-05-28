model IdealGTOThyristor
  extends Modelica.Electrical.Analog.Interfaces.IdealSemiconductor;
  Modelica.Blocks.Interfaces.BooleanInput fire;

equation 
  // The thyristor is off when the semiconductor state variable s is less than 0
  // or when the fire signal is false.
  off = s < 0 or not fire;

  // The rest of the equations for the ideal GTO thyristor go here.
  // This could include the equations for the thyristor's behavior,
  // such as the relationship between the input voltage and the semiconductor's state.
end IdealGTOThyristor;