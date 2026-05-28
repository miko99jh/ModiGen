model Xnor
 extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(nInput=2, nOutput=1);
    parameter Integer nInput=2;
    parameter Integer nOutput=1;
    parameter Real Ts=0;
    output Boolean y[nOutput];
    input Boolean u[nInput];
  equation 
    assert(nInput>=2, "The number of inputs should be at least 2");
    when Ts > 0 then
      y[1] = not Functions.Xor(u[:], nInput) within 0..1;
    else
      y[1] = not Functions.Xor(u[:], nInput);
    end when;
  end Xnor;