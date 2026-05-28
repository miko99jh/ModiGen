model RealSwitch
  extends Modelica.Electrical.Analog.Basic.Resistor(R=0.01);
  Modelica.Electrical.Analog.Ideal.ControlledIdealTwoWaySwitch S(level=2.5);
  Modelica.Electrical.Analog.Interfaces.Pin p;
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin control;
equation 
  connect(p, R.p);
  connect(R.n, S.p);
  connect(S.n1, n1);
  connect(S.n2, n2);
  connect(control, S.trigger);
end RealSwitch;