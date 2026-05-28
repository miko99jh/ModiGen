block Tanh
  extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;
  input Modelica.ComplexBlocks.Interfaces.ComplexInput uInternal;
  output Modelica.ComplexBlocks.Interfaces.ComplexOutput y;
algorithm 
  y := Modelica.ComplexMath.tanh(uInternal);
end Tanh;