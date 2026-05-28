model Xnor
 extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(
    nInput=2, 
    final nOutput=1);

  // Parameters
  parameter Real Ts = 0 "Sample time (0 for continuous operation)";

equation
  // Assert that the number of inputs is at least 2
  assert(nInput >= 2, "The number of inputs (nInput) must be greater than or equal to 2.");

  // Continuous or sampled operation
  if Ts > 0 then
    // Sampled operation
    when sample(0, Ts) then
      y[1] = not Functions.Xor(u[:], nInput);
    end when;
  else
    // Continuous operation
    y[1] = not Functions.Xor(u[:], nInput);
  end if;

end Xnor;