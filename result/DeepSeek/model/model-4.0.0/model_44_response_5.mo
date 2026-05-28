block Tanh
model Tanh
  extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;
  input Complex uInternal;
  output Complex y;
algorithm 
  y := Modelica.ComplexMath.tanh(uInternal);
end Tanh;