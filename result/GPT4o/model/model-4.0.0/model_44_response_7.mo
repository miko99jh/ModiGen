block Tanh
 extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;

protected 
  Modelica.ComplexMath.Complex uInternal; // Internal complex input

equation 
  uInternal = u; // Assign the input to the internal variable
  y = Modelica.ComplexMath.tanh(uInternal); // Calculate the hyperbolic tangent of the input

end Tanh;