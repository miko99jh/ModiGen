model IMC_Transformer
 extends Modelica.Electrical.Machines.Examples.InductionMachines.IMC_Transformer;

  // Parameters
  parameter Modelica.SIunits.Voltage V_nominal = 400 "Nominal voltage";
  parameter Modelica.SIunits.Frequency f_nominal = 50 "Nominal frequency";

  // Components
  Modelica.Electrical.Machines.BasicMachines.InductionMachines.SquirrelCage squirrelCageMachine(
    V_nominal = V_nominal,
    f_nominal = f_nominal) "Squirrel cage induction machine";

  Modelica.Electrical.Analog.Basic.Resistor loadResistor(
    R = 10) "Load resistor";

  Modelica.Electrical.Analog.Basic.Inductor loadInductor(
    L = 0.1) "Load inductor";

  Modelica.Electrical.Analog.Basic.Ground ground "Ground";

  Modelica.Electrical.Analog.Basic.VoltageSourceAC voltageSource(
    V = V_nominal,
    freqHz = f_nominal) "AC voltage source";

  // Connections
equation
  connect(voltageSource.p, squirrelCageMachine.plug_p) "Connect voltage source to machine";
  connect(squirrelCageMachine.plug_n, ground.p) "Connect machine to ground";
  connect(squirrelCageMachine.plug_p, loadResistor.p) "Connect machine to load resistor";
  connect(loadResistor.n, loadInductor.p) "Connect load resistor to load inductor";
  connect(loadInductor.n, ground.p) "Connect load inductor to ground";

  annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.001),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}))
  );
end IMC_Transformer;