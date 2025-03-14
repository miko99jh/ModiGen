block Tanh1 "Output the hyperbolic tangent of the input"
  extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;
equation
  y = Modelica.ComplexMath.tanh(uInternal);
end Tanh1;
