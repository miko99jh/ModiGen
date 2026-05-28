block Tanh
model Tanh
  extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;
  input Complex uInternal(unit="1") "Complex input signal";
  output Complex y(unit="1") "Complex output signal";
algorithm 
  y := Modelica.ComplexMath.tanh(uInternal);
end Tanh;