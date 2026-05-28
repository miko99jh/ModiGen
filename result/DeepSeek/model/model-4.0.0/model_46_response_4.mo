block ComplexToReal extends Modelica.ComplexBlocks.Icons.ComplexBlock
  "Convert complex input into Cartesian components"
  import Modelica.ComplexBlocks.Interfaces;
  import Modelica.Blocks.Interfaces;
  parameter Boolean useConjugateInput=false 
    "If true, the input is treated as its conjugate";
  Interfaces.ComplexInput u 
    "Complex input";
  RealOutput re 
    "Real part of the input";
  RealOutput im 
    "Imaginary part of the input";
equation 
  re = useConjugateInput and u.re < 0? -u.re : u.re;
  im = useConjugateInput and u.im < 0? -u.im : u.im;
end ComplexToReal;