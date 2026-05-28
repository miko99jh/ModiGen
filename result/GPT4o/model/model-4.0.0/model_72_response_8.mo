model IMC_Transformer
 extends Modelica.Electrical.Machines.Examples.InductionMachines.IMC_Transformer;

  // Parameters
  parameter Modelica.SIunits.Voltage V_nominal = 400 "Nominal voltage";
  parameter Modelica.SIunits.Frequency f_nominal = 50 "Nominal frequency";
  parameter Modelica.SIunits.Power P_nominal = 10000 "Nominal power";

  // Components
  Modelica.Electrical.Machines.Basic.InductionMachines.IMC_SquirrelCage squirrelCageMachine(
    V_nominal=V_nominal, 
    f_nominal=f_nominal, 
    P_nominal=P_nominal) "Squirrel cage induction machine";

  Modelica.Electrical.Analog.Basic.Resistor loadResistor(R=10) "Load resistor";
  Modelica.Electrical.Analog.Basic.Transformer transformer(
    V1_nominal=V_nominal, 
    V2_nominal=V_nominal/2) "Transformer";

  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltageSource(
    V=V_nominal, 
    freqHz=f_nominal) "AC voltage source";

  // Connections
  equation
    connect(sineVoltageSource.p, transformer.p1);
    connect(transformer.n1, squirrelCageMachine.plug_p);
    connect(squirrelCageMachine.plug_n, loadResistor.p);
    connect(loadResistor.n, transformer.n2);
    connect(transformer.p2, sineVoltageSource.n);

  annotation(
    uses(Modelica(version="4.0.0")),
    experiment(StartTime=0, StopTime=1, Tolerance=1e-6, Interval=0.001),
    Documentation(info="<html><p>Model representing a test example for starting an induction machine with a squirrel cage using a transformer.</p></html>")
  );
end IMC_Transformer;