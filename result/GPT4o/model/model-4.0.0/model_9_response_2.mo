model ComplexPoles
 extends IndustrialControlSystems.LinearSystems.Interfaces.DiscreteBaseBlock;

  // Parameters
  parameter Real xi(min=0, max=1) = 0.8 "Damping coefficient";
  parameter Real omegan(min=0) = 0.1 "Natural frequency";
  parameter Real mu = 1 "Gain";
  parameter Real y_start = 0 "Output initial value";
  parameter Real dy_start = 0 "Slope initial value";

  // Protected variables
protected 
  Real u_pre1 "Previous input value";
  Real y_pre1 "Previous output value";

  // Initial equations
initial equation
  pre(y) = y_start;
  pre(y_pre1) = dy_start;

equation
  // Ensure damping coefficient is within valid range
  assert(0 <= xi and xi <= 1, "Damping coefficient xi must be between 0 and 1");

  // Discrete sampling events
  when sample(0, Ts) then
    // Process output calculation using the provided function
    y = IndustrialControlSystems.LinearSystems.Discrete.Functions.fCmplx(
          alfa = alfa,
          u = u,
          pre(u) = pre(u),
          pre(u_pre1) = pre(u_pre1),
          pre(y) = pre(y),
          pre(y_pre1) = pre(y_pre1),
          Ts = Ts,
          mu = mu,
          xi = xi,
          omegan = omegan);

    // Update previous values for the next sample
    u_pre1 = pre(u);
    y_pre1 = pre(y);
  end when;

end ComplexPoles;