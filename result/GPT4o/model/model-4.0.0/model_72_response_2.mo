model IMC_Transformer
 extends Modelica.Electrical.Machines.Examples.InductionMachines.IMC_Transformer;

  // Parameters
  parameter Modelica.SIunits.Voltage V_nominal = 400 "Nominal voltage";
  parameter Modelica.SIunits.Frequency f_nominal = 50 "Nominal frequency";
  parameter Modelica.SIunits.Power P_nominal = 10000 "Nominal power";

  // Components
  Modelica.Electrical.Machines.Basic.InductionMachines.IMC_SquirrelCage squirrelCageMachine(
    V_nominal = V_nominal,
    f_nominal = f_nominal,
    P_nominal = P_nominal) "Squirrel cage induction machine";

  Modelica.Electrical.Analog.Basic.Resistor loadResistor(R = 10) "Load resistor";
  Modelica.Electrical.Analog.Basic.Transformer transformer(
    V1_nominal = V_nominal,
    V2_nominal = V_nominal / sqrt(3)) "Transformer";

  // Connections
  equation
    connect(transformer.port1, squirrelCageMachine.port);
    connect(transformer.port2, loadResistor.p);
    connect(loadResistor.n, squirrelCageMachine.port);

  // Simulation settings
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.01),
    documentation(info="<html>
      <p>Model representing the starting of an induction machine with a squirrel cage using a transformer.</p>
      <p>Components include a squirrel cage induction machine, a transformer, and a load resistor.</p>
      </html>")
  );
end IMC_Transformer;