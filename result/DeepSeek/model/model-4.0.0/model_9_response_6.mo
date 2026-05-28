model ComplexPoles
  extends IndustrialControlSystems.LinearSystems.Interfaces.DiscreteBaseBlock;
  parameter Real xi = 0.8 "Damping coefficient";
  parameter Real omegan = 0.1 "Natural frequency";
  parameter Real mu = 1 "Gain";
  parameter Real y_start = 0 "Output initial value";
  parameter Real dy_start = 0 "Slope initial value";
  protected Real u_pre1;
  protected Real y_pre1;
initial equation
  pre(y) = y_start;
  pre(y_pre1) = dy_start;
equation
  assert(0 <= xi and xi <= 1, "Damping coefficient out of range");
  sample(0, Ts) when true then
    pre(y) = IndustrialControlSystems.LinearSystems.Discrete.Functions.fCmplx((alfa,u,pre(u),u_pre1,pre(y),y_pre1,Ts,mu,xi,omegan));
    u_pre1 = pre(u);
    y_pre1 = pre(y);
end ComplexPoles;