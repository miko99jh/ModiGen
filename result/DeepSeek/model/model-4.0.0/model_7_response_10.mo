model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;
  parameter Real Ymax=1 "Maximum output value";
  parameter Real Ymin=0 "Minimum output value";
  parameter Real ThL=0 "Low input threshold value";
  parameter Real ThH=0 "High input threshold value";
  parameter Boolean initState=false "Initial state of the relay";
  protected Boolean state = initState "Relay state";
  protected Boolean pre(start=initState) = state "Pre-state for event handling";
equation 
  pre(state) = initState;
  if Ts > 0 then
    der(state) = 0;
    when sample(0, Ts) then
      if u > ThH and not pre(state) then
        state = true;
      elseif u < ThL and pre(state) then
        state = false;
      end if;
    end when;
  else
    if u > ThH and not state then
      state = true;
    elseif u < ThL and state then
      state = false;
    end if;
  end if;
  y = if state then Ymax else Ymin;
end RelayHysteresis;