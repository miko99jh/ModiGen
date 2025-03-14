model Pipe1
  // This model represents a simple pipe with fluid flowing through it.
  // Parameters
  parameter Modelica.Units.SI.Length L = 1 "Length of the pipe";
  parameter Modelica.Units.SI.Length D = 0.05 "Diameter of the pipe";
  parameter Modelica.Units.SI.Pressure P1 = 1080 "Pressure at the start of the pipe";
  parameter Modelica.Units.SI.Pressure P2 = 900"Pressure at the end of the pipe";
  parameter Modelica.Units.SI.DynamicViscosity mu = 2e-3;

  // Variables
  Modelica.Units.SI.KinematicViscosity c;
  Modelica.Units.SI.Volume Q "Volume through the pipe";
  Modelica.Units.SI.VolumeFlowRate v "Volumetric flow rate through the pipe";
  // Equations
  equation
  // Continuity equation
    c = (Modelica.Constants.pi*D^4)/(128*mu*L);
    Q = (P1 - P2)*c;
    v = 4*Q / (Modelica.Constants.pi*D^2);
end Pipe1;
