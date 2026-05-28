model TransformerWithPhaseShifterTarget
 extends TransformerWithPhaseShifterInterval;

  // Parameters
  parameter Types.Current targetValueI = Types.Current.NotUsed "Target current value";
  parameter Types.Current deadBandI = Types.Current.NotUsed "Acceptable dead-band around the current target value";
  parameter Types.ActivePower targetValueP = Types.ActivePower.NotUsed "Target active power value";
  parameter Types.ActivePower deadBandP = Types.ActivePower.NotUsed "Acceptable dead-band around the active power target value";

  // Final values for interval limits
  final parameter Types.Current IMax = targetValueI + deadBandI "Maximum current limit";
  final parameter Types.Current IMin = targetValueI - deadBandI "Minimum current limit";
  final parameter Types.ActivePower PMax = targetValueP + deadBandP "Maximum active power limit";
  final parameter Types.ActivePower PMin = targetValueP - deadBandP "Minimum active power limit";

  // Initial conditions and assertions
  initial equation
    if quantitySel == MonitoredQuantitySelection.currentMagnitude then
      assert(targetValueI > deadBandI, "targetValueI must be greater than deadBandI");
      assert(deadBandI > 0, "deadBandI must be positive");
      assert(targetValueI >= 0, "targetValueI must be non-negative");
    elseif quantitySel == MonitoredQuantitySelection.activePower then
      assert(targetValueP > deadBandP, "targetValueP must be greater than deadBandP");
      assert(deadBandP > 0, "deadBandP must be positive");
      assert(targetValueP >= 0, "targetValueP must be non-negative");
    end if;

end TransformerWithPhaseShifterTarget;