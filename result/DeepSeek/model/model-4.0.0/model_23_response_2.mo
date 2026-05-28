model GovHydro4GeneralPurpose
  extends PowerGrids.Electrical.Controls.TurbineGovernors.BaseClasses.GovHydro4Base;

  // Define the dead-band component
  Components.DeadBand deadBandDb2(
    final min=minDeadBand,
    final max=maxDeadBand,
    final k=kDeadBand
  );

  // Define the divider unit
  Blocks.Divider div1(
    final n=nDivider
  );

equation 
  // Complete the control loop by routing the output signal of the dead-band component to the first input port of the divider unit
  div1.u1 = deadBandDb2.y;

  // Define the output signal of the governor
  y = div1.y;

end GovHydro4GeneralPurpose;