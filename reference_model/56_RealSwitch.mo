model RealSwitch "Ideal switch with resistance"
  Modelica.Electrical.Analog.Ideal.ControlledIdealTwoWaySwitch S(level=2.5);
  Modelica.Electrical.Analog.Basic.Resistor R(R=0.01);
  Modelica.Electrical.Analog.Interfaces.Pin p;
  Modelica.Electrical.Analog.Interfaces.Pin n1;
  Modelica.Electrical.Analog.Interfaces.Pin n2;
  Modelica.Electrical.Analog.Interfaces.Pin control;
equation
  connect(p, R.p);
  connect(R.n, S.p);
  connect(n1, S.n1);
  connect(n2, S.n2);
  connect(control, S.control);
end RealSwitch;
