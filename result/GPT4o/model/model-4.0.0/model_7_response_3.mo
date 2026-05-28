model RelayHysteresis
 extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;

  parameter Real Ymax = 1 "Maximum output value";
  parameter Real Ymin = 0 "Minimum output value";
  parameter Real ThL = 0 "Low input threshold value";
  parameter Real ThH = 0 "High input threshold value";
  parameter Boolean initState = false "Initial state of the relay";
  parameter Real Ts = 0 "Sampling time, Ts=0 for continuous-time mode";

  protected
    discrete Boolean state(start = initState) "Relay state";

  initial equation
    pre(state) = initState;

  equation
    if Ts > 0 then
      when sample(0, Ts) then
        if u > ThH then
          state = true;
        elseif u < ThL then
          state = false;
        else
          state = pre(state);
        end if;
      end when;
    else
      if u > ThH then
        state = true;
      elseif u < ThL then
        state = false;
      else
        state = pre(state);
      end if;
    end if;

    y = if state then Ymax else Ymin;
end RelayHysteresis;