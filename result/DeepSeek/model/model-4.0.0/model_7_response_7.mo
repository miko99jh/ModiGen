model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;
  parameter Real Ymax(unit="") = 1 "Maximum output value";
  parameter Real Ymin(unit="") = 0 "Minimum output value";
  parameter Real ThL(unit="") = 0 "Low input threshold value";
  parameter Real ThH(unit="") = 0 "High input threshold value";
  parameter Boolean initState = false "Initial state of the relay";
  protected Boolean state = initState "Relay state";
  protected Boolean pre(start=initState) = initState "Pre-state of relay";
initial equation
  pre = initState;
equation
  if Ts > 0 then
    state = sample(pre, Ts, (u > ThH) and not pre, (u < ThL) and pre);
  else
    state = (u > ThH) and not pre or (u < ThL) and pre;
  end if;
  y = if state then Ymax else Ymin;
end RelayHysteresis;