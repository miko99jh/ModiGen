model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock(
    final n=1,
    final m=1);
  parameter Real Ymax=1 "Maximum output value";
  parameter Real Ymin=0 "Minimum output value";
  parameter Real ThL=0 "Low input threshold value";
  parameter Real ThH=0 "High input threshold value";
  parameter Boolean initState=false "Initial state of the relay";
  protected Boolean state = initState "Relay state";
  protected Boolean pre(start=initState) = state "Pre-state";
initial equation
  pre = initState;
equation
  if Ts > 0 then
    state = sample(state, Ts, pre, (u > ThH) and not pre, (u < ThL) and pre);
  else
    state = (u > ThH) and not pre or (u < ThL) and pre;
  end if;
  y = if state then Ymax else Ymin;
end RelayHysteresis;