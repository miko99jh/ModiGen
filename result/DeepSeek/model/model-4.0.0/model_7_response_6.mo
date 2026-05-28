model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;
  parameter Real Ymax = 1 "Maximum output value";
  parameter Real Ymin = 0 "Minimum output value";
  parameter Real ThL = 0 "Low input threshold value";
  parameter Real ThH = 0 "High input threshold value";
  parameter Boolean initState = false "Initial state of the relay";
  protected Boolean state = initState "Relay state";
  protected Boolean pre(start = initState) = state "Pre-state for event handling";
initial equation
  pre = initState;
equation
  when sample(0, Ts) then
    if Ts > 0 then
      if not state and u > ThH then
        state = true;
      elseif state and u < ThL then
        state = false;
      end if;
    else
      if not state and u > ThH then
        state = true;
      elseif state and u < ThL then
        state = false;
      end if;
    end if;
  end when;
  y = if state then Ymax else Ymin;
end RelayHysteresis;