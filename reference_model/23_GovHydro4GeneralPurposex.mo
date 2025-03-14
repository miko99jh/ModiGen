model GovHydro4GeneralPurposex "Simple general-purpose governor for hydraulic turbines"
  extends PowerGrids.Electrical.Controls.TurbineGovernors.BaseClasses.GovHydro4Base;
equation
  connect(deadBandDb2.y, div1.u1);
end GovHydro4GeneralPurposex;
