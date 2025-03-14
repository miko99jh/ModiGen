model Test_FlipFlopSR1
  Modelica.Blocks.Sources.BooleanTable setSIGNAL(startValue=false,
      table={1,5,8,10,12,15});
  Modelica.Blocks.Sources.BooleanTable resetSIGNAL(startValue=false,
      table={6,7,12,14});
  IndustrialControlSystems.Logical.LogicalOperations.FlipFlopSR flipFlopSR(
          Ts=0.1,
          q_start=false);
equation
  connect(setSIGNAL.y, flipFlopSR.u1);
  connect(resetSIGNAL.y, flipFlopSR.u2);
end Test_FlipFlopSR1;
