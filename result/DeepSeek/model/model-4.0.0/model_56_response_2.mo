model RealSwitch
  extends Modelica.Electrical.Analog.Basic.Resistor(R=0.01);
  Modelica.Electrical.Analog.Ideal.ControlledIdealTwoWaySwitch S(level=2.5);
  Modelica.Electrical.Analog.Interfaces.Pin p, n1, n2, control;
equation 
  // Input Series Path
  connect(p, R.p);
  connect(R.n, S.p);
  // Dual Output Routing
  connect(S.n1, n1);
  connect(S.n2, n2);
  // Control Logic
  connect(control, S.trigger);
end RealSwitch;