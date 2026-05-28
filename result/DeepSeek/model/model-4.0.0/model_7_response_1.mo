model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;
  parameter Real Ymax(start=1) = 1 "Maximum output value";
  parameter Real Ymin(start=0) = 0 "Minimum output value";
  parameter Real ThL(start=0) = 0 "Low input threshold value";
  parameter Real ThH(start=0) = 0 "High input threshold value";
  parameter Boolean initState(start=false) = false "Initial state of the relay";
  protected Boolean state = initState "Relay state";
  protected Boolean pre(start=initState) = initState "Pre-state of the relay";
initial equation
  pre = initState;
equation
  when sample(0, Ts) then
    if Ts > 0 then
      state = if (u > ThH and not pre) or (u < ThL and pre) then not state else state;
    else
      state = if (u > ThH and not pre) or (u < ThL and pre) then not state else state;
    end if;
  end when;
  y = if state then Ymax else Ymin;
end RelayHysteresis;