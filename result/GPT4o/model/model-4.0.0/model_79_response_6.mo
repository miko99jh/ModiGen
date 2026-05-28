block VfController
 extends Modelica.Blocks.Interfaces.SIMO(u(unit="Hz"), final nout=m);

  parameter Integer m = 3 "Number of phases";
  parameter Modelica.Units.SI.Angle orientation[m] = -Modelica.Electrical.Polyphase.Functions.symmetricOrientation(m) "Orientation of phases";
  parameter Modelica.Units.SI.Voltage VNominal "Nominal RMS voltage per phase";
  parameter Modelica.Units.SI.Frequency fNominal "Nominal frequency";
  parameter Modelica.Units.SI.Angle BasePhase = 0 "Common phase shift";
  parameter Boolean EconomyMode = false "Economy mode";

  output Modelica.Units.SI.Angle x(start=0, fixed=true) "Integrator state";
  output Modelica.Units.SI.Voltage amplitude "Voltage amplitude";

protected 
  Integer pow = if EconomyMode then 2 else 1;

equation 
  // Voltage Modulation
  if u[1] < fNominal then
    amplitude = VNominal * (u[1] / fNominal)^pow;
  else
    amplitude = VNominal;
  end if;

  // Phase Integration
  der(x) = 2 * Modelica.Constants.pi * u[1];

  // Multi-phase Synthesis
  for i in 1:m loop
    y[i] = amplitude * sin(x + BasePhase + orientation[i]);
  end for;

end VfController;