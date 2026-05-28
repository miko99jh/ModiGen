block ComplexToReal extends Modelica.ComplexBlocks.Icons.ComplexBlock
  "Convert complex input into Cartesian components"
  import Modelica.ComplexBlocks.Interfaces;
  extends Modelica.Blocks.Icons.Block;
  parameter Boolean useConjugateInput=false 
    "If true, process the conjugate of the input";
  Interfaces.ComplexInput u 
    "Complex input";
  Blocks.Interfaces.RealOutput re 
    "Real part of the input";
  Blocks.Interfaces.RealOutput im 
    "Imaginary part of the input";
equation 
  re = useConjugateInput and u.re < 0? -u.re : u.re;
  im = useConjugateInput and u.im < 0? -u.im : u.im;
end ComplexToReal;