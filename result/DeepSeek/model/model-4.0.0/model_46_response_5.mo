block ComplexToReal extends Modelica.ComplexBlocks.Icons.ComplexBlock
  "Convert complex input into Cartesian components"
  import Modelica.ComplexBlocks.Interfaces;
  extends Modelica.Blocks.Icons.Block;
  parameter Boolean useConjugateInput=false 
    "=true, if input should be treated as its conjugate";
  Interfaces.ComplexInput u 
    "Complex input";
  Blocks.Interfaces.RealOutput re 
    "Real part of the input";
  Blocks.Interfaces.RealOutput im 
    "Imaginary part of the input";
equation 
  re = if useConjugateInput then conjugate(u.re) else u.re;
  im = if useConjugateInput then -conjugate(u.im) else u.im;
end ComplexToReal;