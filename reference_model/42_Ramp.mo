block Ramp1 "Generate ramp signal based on counted clock ticks"
  extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSO;
  parameter Real height=1 "Height of ramps";
  parameter Integer durationTicks(min=1) = 1
"Durations of ramp in number of clock ticks";
  parameter Real offset=0 "Offset of output signal";

  parameter Integer startTick(min=1) = 1
"Output y = offset for clock tick < startTick";
protected
  Integer counter(start=0);
equation
  // stop counter after counter = startTick+durationTicks to avoid integer overflow for long running simulations
  counter = if previous(counter) < startTick+durationTicks then previous(counter) + 1 else previous(counter);

  y = offset + (if counter < startTick then 0 else if counter < (startTick +
    durationTicks) then (counter - startTick)*height/durationTicks else height);
end Ramp1;
