block ComplexToReal
 extends Modelica.ComplexBlocks.Icons.ComplexBlock;

  // Complex input
  Modelica.ComplexBlocks.Interfaces.ComplexInput u;

  // Real outputs
  Modelica.Blocks.Interfaces.RealOutput re;
  Modelica.Blocks.Interfaces.RealOutput im;

  // Parameter to determine if the conjugate of the input should be used
  parameter Boolean useConjugateInput = false "Use conjugate of the input";

equation
  // Assign the real part of the input to the output 're'
  re = Modelica.ComplexMath.real(u);

  // Assign the imaginary part of the input to the output 'im'
  // Negate the imaginary part if useConjugateInput is true
  if useConjugateInput then
    im = -Modelica.ComplexMath.imag(u);
  else
    im = Modelica.ComplexMath.imag(u);
  end if;

end ComplexToReal;