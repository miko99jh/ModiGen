block Tanh
model Tanh
  extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;
  input Modelica.ComplexBlocks.Interfaces.ComplexSISO uInternal;
  output Modelica.ComplexBlocks.Interfaces.ComplexSISO y;
algorithm 
  y := Modelica.ComplexMath.tanh(uInternal);
end Tanh;