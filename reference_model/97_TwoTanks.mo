model TwoTanks1 "Hydraulic system involving two tanks"
  import Modelica.Units.SI;

  //constants
  constant Real pi = Modelica.Constants.pi;
  constant Real g = Modelica.Constants.g_n;

  //parameters
  parameter Modelica.Units.SI.Length L = 0.1 "Pipe length";
  parameter Modelica.Units.SI.Length D = 0.2 "Pipe diameter";
  parameter Modelica.Units.SI.Density rho = 0.2 "Fluid density";
  parameter Modelica.Units.SI.DynamicViscosity mu = 2e-3;
  parameter Modelica.Units.SI.Area A1 = 1.0 "Area of left tank";
  parameter Modelica.Units.SI.Area A2 = 2.0 "Area of right tank";
  parameter Modelica.Units.SI.KinematicViscosity c = (pi*D^4)/(128*mu*L);

  //variables
  Modelica.Units.SI.Pressure P1,P2;
  Modelica.Units.SI.Length H1(start=0.4),H2(start=0.6);
  Modelica.Units.SI.VolumeFlowRate Q;

equation
  //Pressure equations
  P1 = rho*H1*g;
  P2 = rho*H2*g;

  //Flow rate
  Q = c*(H1-H2);

  //conservation of mass
  A1*der(H1) = -Q;
  A2*der(H2) = Q;

end TwoTanks1;
