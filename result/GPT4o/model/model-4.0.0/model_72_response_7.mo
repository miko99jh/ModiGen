model IMC_Transformer
 extends Modelica.Electrical.Machines.Examples.InductionMachines.IMC_Transformer;

  // Parameters
  parameter Modelica.SIunits.Frequency fNominal = 50 "Nominal frequency";
  parameter Modelica.SIunits.Voltage VNominal = 400 "Nominal voltage";

  // Components
  Modelica.Electrical.Machines.BasicMachines.InductionMachines.SquirrelCage squirrelCageMachine(
    p=2, 
    m=3, 
    fNominal=fNominal, 
    VNominal=VNominal) 
    "Squirrel cage induction machine";

  Modelica.Electrical.Analog.Basic.Resistor loadResistor(R=10) "Load resistor";

  Modelica.Electrical.Analog.Basic.Inductor loadInductor(L=0.1) "Load inductor";

  Modelica.Electrical.Analog.Basic.Ground ground "Ground";

  Modelica.Electrical.Analog.Basic.VoltageSourceAC voltageSource(
    V=VNominal, 
    f=fNominal) 
    "AC voltage source";

  // Connections
  equation
    connect(voltageSource.p, squirrelCageMachine.plug_p) "Connect voltage source to machine";
    connect(squirrelCageMachine.plug_n, loadResistor.p) "Connect machine to load resistor";
    connect(loadResistor.n, loadInductor.p) "Connect load resistor to load inductor";
    connect(loadInductor.n, ground.p) "Connect load inductor to ground";
    connect(voltageSource.n, ground.p) "Connect voltage source to ground";

end IMC_Transformer;