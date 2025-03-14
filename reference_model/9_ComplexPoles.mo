model ComplexPoles "Process with complex poles"
  extends IndustrialControlSystems.LinearSystems.Interfaces.DiscreteBaseBlock;
  parameter Real xi = 0.8 "|Block parameters| Damping coefficient";
  parameter Real omegan = 0.1 "|Block parameters| Natural frequency";
  parameter Real mu = 1 "|Block parameters| Gain";
  parameter Real y_start = 0 "|Initial conditions| Output initial value";
  parameter Real dy_start = 0 "|Initial conditions| Slope initial value";
protected
  Real u_pre1;
  Real y_pre1;
initial equation
  pre(y) = y_start;
  pre(y_pre1) = dy_start;
equation
  assert(xi>= 0 and xi <= 1,"Dumping coefficient must be between 0 and 1.");

  when sample(0,Ts) then
    y = IndustrialControlSystems.LinearSystems.Discrete.Functions.fCmplx(alfa,u,pre(u),pre(u_pre1),pre(y),pre(y_pre1),Ts,mu,xi,omegan);
    u_pre1 = pre(u);
    y_pre1 = pre(y);
  end when;
end ComplexPoles;
