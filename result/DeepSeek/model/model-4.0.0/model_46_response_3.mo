block ComplexToReal extends Modelica.ComplexBlocks.Icons.ComplexBlock
  "Convert a complex input signal into its Cartesian components"
  import Modelica.ComplexBlocks.Interfaces;
  import Modelica.Blocks.Interfaces;
  parameter Boolean useConjugateInput=false 
    "If true, the input is treated as its conjugate";
  Interfaces.ComplexInput u 
    "Complex input";
  RealOutput re "Real part of the input";
  RealOutput im "Imaginary part of the input";
equation 
  re = if useConjugateInput then conjugate(u.re) else u.re;
  im = if useConjugateInput then -conjugate(u.im) else u.im;
end ComplexToReal;