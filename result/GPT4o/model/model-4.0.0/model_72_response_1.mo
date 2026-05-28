model IMC_Transformer
 extends Modelica.Electrical.Machines.Examples.InductionMachines.IMC_Transformer;

  // Parameters
  parameter Modelica.SIunits.Voltage V_nominal = 400 "Nominal voltage";
  parameter Modelica.SIunits.Frequency f_nominal = 50 "Nominal frequency";
  parameter Modelica.SIunits.Power P_nominal = 10000 "Nominal power";

  // Components
  Modelica.Electrical.Machines.BasicMachines.InductionMachines.SquirrelCage squirrelCageMachine(
    V_nominal = V_nominal,
    f_nominal = f_nominal,
    P_nominal = P_nominal) "Squirrel cage induction machine";

  Modelica.Electrical.Analog.Basic.Transformer transformer(
    V1 = V_nominal,
    V2 = V_nominal / sqrt(3)) "Transformer for starting the induction machine";

  Modelica.Electrical.Analog.Basic.Resistor loadResistor(R = 10) "Load resistor";

  // Connections
  equation
    connect(transformer.port1, squirrelCageMachine.stator);
    connect(transformer.port2, loadResistor.p);
    connect(loadResistor.n, squirrelCageMachine.stator);

  annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.01),
    Documentation(info = "Test example for starting an induction machine with a squirrel cage using a transformer.")
  );
end IMC_Transformer;