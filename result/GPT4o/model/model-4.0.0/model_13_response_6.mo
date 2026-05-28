model Xnor
 extends IndustrialControlSystems.Logical.LogicalOperations.Interfaces.LogicalBlock(
    nInput=2, 
    final nOutput=1);

  parameter Real Ts = 0 "Sample time";

equation
  // Ensure that the number of inputs is at least 2
  assert(nInput >= 2, "The number of inputs must be at least 2.");

  if Ts > 0 then
    // Sample the input signals at regular intervals if Ts is greater than 0
    when sample(0, Ts) then
      y[1] = not Functions.Xor(u[:], nInput);
    end when;
  else
    // Directly perform the XNOR operation if Ts is 0 or less
    y[1] = not Functions.Xor(u[:], nInput);
  end if;
end Xnor;