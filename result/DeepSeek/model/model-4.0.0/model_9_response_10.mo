model ComplexPoles
  extends IndustrialControlSystems.LinearSystems.Interfaces.DiscreteBaseBlock;
  parameter Real xi(start = 0.8) "Damping coefficient";
  parameter Real omegan(start = 0.1) "Natural frequency";
  parameter Real mu(start = 1) "Gain";
  parameter Real y_start(start = 0) "Output initial value";
  parameter Real dy_start(start = 0) "Slope initial value";
  protected Real u_pre1(start = 0);
  protected Real y_pre1(start = 0);
initial equation
  pre(y) = y_start;
  pre(y_pre1) = dy_start;
equation
  assert(0 <= xi and xi <= 1, "Damping coefficient must be between 0 and 1");
  sample(0, Ts);
  y = IndustrialControlSystems.LinearSystems.Discrete.Functions.fCmplx(
    (alfa,u,pre(u),pre(u_pre1),pre(y),pre(y_pre1),Ts,mu,xi,omegan)
  );
  u_pre1 = pre(u);
  y_pre1 = pre(y);
end ComplexPoles;