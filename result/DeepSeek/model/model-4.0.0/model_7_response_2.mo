model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;

  parameter Real Ymax(start = 1) = 1 "Maximum output value";
  parameter Real Ymin(start = 0) = 0 "Minimum output value";
  parameter Real ThL(start = 0) = 0 "Low input threshold value";
  parameter Real ThH(start = 0) = 0 "High input threshold value";
  parameter Boolean initState(start = false) = false "Initial state of the relay";

  protected Boolean state = initState "Relay state";

  output Real y = Ymin "Output";

  initial equation
    pre(state) = initState;

  equation
    if Ts > 0 then
      der(y) = 0;
      when sample(0, Ts) then
        if u > ThH and not state then
          state = true;
        elseif u < ThL and state then
          state = false;
        end if;
        y = if state then Ymax else Ymin;
      end when;
    else
      if u > ThH and not state then
        state = true;
      elseif u < ThL and state then
        state = false;
      end if;
      y = if state then Ymax else Ymin;
    end if;
end RelayHysteresis;