model TransformerWithPhaseShifterTarget
 extends TransformerWithPhaseShifterInterval;

  // Parameters for target values and dead-bands
  parameter Types.Current targetValueI = Types.Current.NotUsed "Target current value";
  parameter Types.Current deadBandI = Types.Current.NotUsed "Acceptable dead-band around the current target value";
  parameter Types.ActivePower targetValueP = Types.ActivePower.NotUsed "Target active power value";
  parameter Types.ActivePower deadBandP = Types.ActivePower.NotUsed "Acceptable dead-band around the active power target value";

  // Final parameters for maximum and minimum values based on target and dead-band
  final parameter Types.Current IMax = targetValueI + deadBandI "Maximum current value";
  final parameter Types.Current IMin = targetValueI - deadBandI "Minimum current value";
  final parameter Types.ActivePower PMax = targetValueP + deadBandP "Maximum active power value";
  final parameter Types.ActivePower PMin = targetValueP - deadBandP "Minimum active power value";

  // Initial conditions and assertions
  initial equation
    if quantitySel == MonitoredQuantitySelection.currentMagnitude then
      assert(targetValueI > deadBandI, "Target current value must be greater than dead-band");
      assert(deadBandI > 0, "Dead-band for current must be positive");
      assert(targetValueI >= 0, "Target current value must be non-negative");
    elseif quantitySel == MonitoredQuantitySelection.activePower then
      assert(targetValueP > deadBandP, "Target active power value must be greater than dead-band");
      assert(deadBandP > 0, "Dead-band for active power must be positive");
      assert(targetValueP >= 0, "Target active power value must be non-negative");
    end if;

end TransformerWithPhaseShifterTarget;