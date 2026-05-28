model Xnor
 extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(nInput=2, nOutput=1);
    parameter Integer n=size(u, 1);
    output Boolean y[nOutput];
  equation 
    assert(nInput>=2, "XNOR gate requires at least 2 inputs");
    when sample(0, Ts) then
      y[1] = not Functions.Xor(u[:], nInput);
    else
      y[1] = not Functions.Xor(u[:], nInput);
    end when;
  end Xnor;