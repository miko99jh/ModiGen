model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;
  parameter Real Ymax(unit="") = 1 "Maximum output value";
  parameter Real Ymin(unit="") = 0 "Minimum output value";
  parameter Real ThL(unit="") = 0 "Low input threshold value";
  parameter Real ThH(unit="") = 0 "High input threshold value";
  parameter Boolean initState = false "Initial state of the relay";
  protected Boolean state = initState "Relay state";
  protected Boolean pre(start=initState) = initState "Pre-state for event handling";
initial equation
  pre = initState;
equation
  if Ts > 0 then
    // Discrete-time mode
    when sample(0, Ts) then
      if (u > ThH and not state) then
        state = true;
      elseif (u < ThL and state) then
        state = false;
      end if;
    end when;
    y = state? Ymax : Ymin;
  else
    // Continuous-time mode
    if (u > ThH and not state) then
      state = true;
    elseif (u < ThL and state) then
      state = false;
    end if;
    y = state? Ymax : Ymin;
  end if;
end RelayHysteresis;