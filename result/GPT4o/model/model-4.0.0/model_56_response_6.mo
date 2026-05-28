model RealSwitch
 // Import necessary Modelica libraries
  import Modelica.Electrical.Analog.Ideal;
  import Modelica.Electrical.Analog.Basic;
  import Modelica.Electrical.Analog.Interfaces;

  // Define the components
  ControlledIdealTwoWaySwitch S(level=2.5) "Ideal two-way switch with control level";
  Resistor R(R=0.01) "Resistor with resistance value 0.01 ohms";

  // Define the electrical pins
  Pin p "Input pin";
  Pin n1 "Output pin 1";
  Pin n2 "Output pin 2";
  Pin control "Control pin";

equation
  // Connect the input pin to the resistor
  connect(p, R.p);
  
  // Connect the resistor to the switch
  connect(R.n, S.p);
  
  // Connect the switch outputs to the external pins
  connect(S.n1, n1);
  connect(S.n2, n2);
  
  // Connect the control pin to the switch control
  connect(control, S.control);
end RealSwitch;