model RealSwitch
 // Import necessary Modelica components
  import Modelica.Electrical.Analog.Ideal.ControlledIdealTwoWaySwitch;
  import Modelica.Electrical.Analog.Basic.Resistor;
  import Modelica.Electrical.Analog.Interfaces.Pin;

  // Define electrical pins
  Pin p "Input pin";
  Pin n1 "Output pin 1";
  Pin n2 "Output pin 2";
  Pin control "Control pin";

  // Define the controlled ideal two-way switch with control level
  ControlledIdealTwoWaySwitch S(level=2.5) "Ideal two-way switch";

  // Define the resistor with resistance value
  Resistor R(R=0.01) "Resistor in series with the switch";

equation
  // Connect input pin 'p' to resistor 'R'
  connect(p, R.p);

  // Connect resistor 'R' to the switch's common supply terminal 'S.p'
  connect(R.n, S.p);

  // Connect switch's output channels to external interface pins
  connect(S.n1, n1);
  connect(S.n2, n2);

  // Connect control pin to switch's control input
  connect(control, S.control);
end RealSwitch;