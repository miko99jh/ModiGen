model RelayHysteresis
  extends IndustrialControlSystems.Controllers.Interfaces.BaseBlock(
    annotation(uses(Modelica(version="3.2"))),
    icon = Modelica.Icons.Block,
    parameter Modelica.SIunits.Time Ts = 0,
    parameter Real Ymax = 1,
    parameter Real Ymin = 0,
    parameter Real ThL = 0,
    parameter Real ThH = 0,
    parameter Boolean initState = false
  );

  protected Boolean state = initState;

  initial equation
    pre(state) = initState;

  equation
    if Ts > 0 then
      // Discrete-time mode
      state = sample(state, Ts);
      state = if u > ThH and not pre(state) then true else
              if u < ThL and pre(state) then false else state;
      y = if state then Ymax else Ymin;
    else
      // Continuous-time mode
      state = if u > ThH and not pre(state) then true else
              if u < ThL and pre(state) then false else state;
      y = if state then Ymax else Ymin;
    end if;
end RelayHysteresis;