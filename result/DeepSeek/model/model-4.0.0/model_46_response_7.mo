block ComplexToReal extends Modelica.ComplexBlocks.Icons.ComplexBlock
  "Convert complex input into Cartesian components"
  import Modelica.ComplexBlocks.Interfaces;
  import Modelica.Blocks.Interfaces;
  parameter Boolean useConjugateInput=false 
    "If true, process the conjugate of the input";
  Interfaces.ComplexInput u 
    "Complex input";
  RealOutput re "Real part of input";
  RealOutput im "Imaginary part of input";
equation 
  re = if useConjugateInput then conjugate(u.re) else u.re;
  im = if useConjugateInput then -conjugate(u.im) else u.im;
end ComplexToReal;