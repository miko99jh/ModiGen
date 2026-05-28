block Tanh
extends Modelica.ComplexBlocks.Interfaces.ComplexSISO;
input Complex uInternal "Input complex signal";
output Complex y "Output complex signal";
equation
y = Modelica.ComplexMath.tanh(uInternal);
end Tanh;