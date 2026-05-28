model GovHydro4GeneralPurpose
  extends PowerGrids.Electrical.Controls.TurbineGovernors.BaseClasses.GovHydro4Base;
  input Real u1 "Input signal";
  input Real u2 "Input signal";
  output Real y "Output signal";
equation 
  // Control loop
  y = div1.y;
  div1.u1 = deadBandDb2.y;
  deadBandDb2.u = u1;
  div1.u2 = u2;
end GovHydro4GeneralPurpose;