model ComplexPoles
 extends IndustrialControlSystems.LinearSystems.Interfaces.DiscreteBaseBlock;

  parameter Real xi(min=0, max=1) = 0.8 "Damping coefficient";
  parameter Real omegan = 0.1 "Natural frequency";
  parameter Real mu = 1 "Gain";
  parameter Real y_start = 0 "Output initial value";
  parameter Real dy_start = 0 "Slope initial value";

protected 
  Real u_pre1;
  Real y_pre1;

initial equation
  pre(y) = y_start;
  pre(y_pre1) = dy_start;

equation
  // Ensure the damping coefficient is between 0 and 1
  assert(0 <= xi and xi <= 1, "Damping coefficient xi must be between 0 and 1");

  when sample(0, Ts) then
    // Calculate the process output using the function fCmplx
    y = IndustrialControlSystems.LinearSystems.Discrete.Functions.fCmplx(
          alfa, u, pre(u), pre(u_pre1), pre(y), pre(y_pre1), Ts, mu, xi, omegan);

    // Update the previous values for the next sample
    u_pre1 = pre(u);
    y_pre1 = pre(y);
  end when;

end ComplexPoles;