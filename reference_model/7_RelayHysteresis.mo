model RelayHysteresis1 "Relay with hysteresis"
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock;
  parameter Real Ymax = 1 "maximum output value" annotation(Evaluate = true);
  parameter Real Ymin = 0 "minimum output value" annotation(Evaluate = true);
  parameter Real ThL = 0 "input treshold (low) value" annotation(Evaluate = true);
  parameter Real ThH = 0 "input treshold (high) value" annotation(Evaluate = true);
  parameter Boolean initState = false "initial state" annotation(Evaluate = true);
protected
  discrete Boolean state( start = initState);
initial equation
  pre(state) = initState;
equation
  if Ts > 0 then
    // Discrete time relay
    when sample(0,Ts) then

      if (u >= ThH and not pre(state)) or (u <= ThL and pre(state)) then
        state = not pre(state);
      else
        state = pre(state);
      end if;

      if state then
        y = Ymax;
      else
        y = Ymin;
      end if;

    end when;
  else
    // continuous time relay
    if state then
      y = Ymax;
    else
      y = Ymin;
    end if;

    when (u >= ThH and not pre(state)) or (u <= ThL and pre(state)) then
      state = not pre(state);
    end when;
  end if;
end RelayHysteresis1;
