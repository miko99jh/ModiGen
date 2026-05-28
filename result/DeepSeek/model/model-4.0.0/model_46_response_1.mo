block ComplexToReal extends Modelica.ComplexBlocks.Icons.ComplexBlock
  "Convert complex input into Cartesian components"
  import Modelica.ComplexBlocks.Interfaces;
  extends Modelica.Blocks.Icons.Block;
  parameter Boolean useConjugateInput=false 
    "=true, if input is conjugate of actual signal";
  input ComplexInput u "Complex input";
  output Real re "Real part of input";
  output Real im "Imaginary part of input";
equation 
  re = if useConjugateInput then conjugate(u.re) else u.re;
  im = if useConjugateInput then -conjugate(u.im) else u.im;
end ComplexToReal;