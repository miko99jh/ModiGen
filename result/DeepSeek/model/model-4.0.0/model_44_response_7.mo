block Tanh
import Modelica.ComplexBlocks.Interfaces.ComplexSISO;
import Modelica.ComplexMath;

equation
  y = ComplexMath.tanh(uInternal);
end Tanh;