block ComplexToReal extends Modelica.ComplexBlocks.Icons.ComplexBlock
  parameter Boolean useConjugateInput=false "If true, input is treated as its conjugate";
  Modelica.ComplexBlocks.Interfaces.ComplexInput u "Complex input";
  Modelica.Blocks.Interfaces.RealOutput re "Real part of input";
  Modelica.Blocks.Interfaces.RealOutput im "Imaginary part of input";
equation
  re = if useConjugateInput then conjugate(u.re) else u.re;
  im = if useConjugateInput then -conjugate(u.im) else u.im;
end ComplexToReal;