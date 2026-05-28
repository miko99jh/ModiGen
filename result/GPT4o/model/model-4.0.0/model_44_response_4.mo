block Tanh
 extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;

equation
  y = Modelica.ComplexMath.tanh(uInternal);
end Tanh;