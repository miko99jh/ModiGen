model IMC_Transformer
 extends Modelica.Electrical.Machines.Examples.InductionMachines.IMC_Transformer;

  // Parameters
  parameter Modelica.SIunits.Voltage V_nominal = 400 "Nominal voltage";
  parameter Modelica.SIunits.Frequency f_nominal = 50 "Nominal frequency";
  parameter Modelica.SIunits.Power P_nominal = 10000 "Nominal power";

  // Components
  Modelica.Electrical.Machines.Basic.InductionMachine imc(
    V_nominal = V_nominal,
    f_nominal = f_nominal,
    P_nominal = P_nominal) "Induction machine component";

  Modelica.Electrical.Analog.Basic.Resistor loadResistance(R = 10) "Load resistance";

  Modelica.Electrical.Analog.Basic.Transformer transformer(
    V1_nominal = V_nominal,
    V2_nominal = V_nominal / sqrt(3)) "Transformer component";

  // Connections
  equation
    connect(transformer.port1, imc.port);
    connect(imc.port, loadResistance.port);

  // Simulation settings
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.01),
    Documentation(info="<html>
      <h1>IMC_Transformer Model</h1>
      <p>This model represents a test example for starting an induction machine with a squirrel cage using a transformer.</p>
      </html>")
  );
end IMC_Transformer;