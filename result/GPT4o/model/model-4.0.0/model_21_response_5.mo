model TransformerWithPhaseShifterTarget
 extends TransformerWithPhaseShifterInterval;

  // Parameters for current magnitude
  parameter Types.Current targetValueI = NotUsed "Target current value";
  parameter Types.Current deadBandI = NotUsed "Acceptable dead-band around the current target value";

  // Parameters for active power
  parameter Types.ActivePower targetValueP = NotUsed "Target active power value";
  parameter Types.ActivePower deadBandP = NotUsed "Acceptable dead-band around the active power target value";

  // Final parameters for current magnitude
  final parameter Types.Current IMax = targetValueI + deadBandI;
  final parameter Types.Current IMin = targetValueI - deadBandI;

  // Final parameters for active power
  final parameter Types.ActivePower PMax = targetValueP + deadBandP;
  final parameter Types.ActivePower PMin = targetValueP - deadBandP;

initial equation
  // Logic based on the selection variable quantitySel
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(targetValueI > deadBandI, "targetValueI must be greater than deadBandI");
    assert(deadBandI > 0, "deadBandI must be greater than 0");
    assert(targetValueI >= 0, "targetValueI must be non-negative");
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    assert(targetValueP > deadBandP, "targetValueP must be greater than deadBandP");
    assert(deadBandP > 0, "deadBandP must be greater than 0");
    assert(targetValueP >= 0, "targetValueP must be non-negative");
  end if;

end TransformerWithPhaseShifterTarget;