model IMC_Transformer
 extends Modelica.Electrical.Machines.Examples.InductionMachines.IMC_Transformer;

  // Parameters
  parameter Modelica.SIunits.Frequency fNominal = 50 "Nominal frequency";
  parameter Modelica.SIunits.Voltage vNominal = 400 "Nominal voltage";

  // Components
  Modelica.Electrical.Machines.BasicMachines.InductionMachines.SquirrelCage squirrelCageMachine(
    p=2, 
    m=3, 
    nNominal=1500, 
    VNominal=vNominal, 
    fNominal=fNominal) "Squirrel cage induction machine";

  Modelica.Electrical.Analog.Basic.Resistor loadResistor(R=10) "Load resistor";

  Modelica.Electrical.Analog.Basic.Inductor loadInductor(L=0.1) "Load inductor";

  Modelica.Electrical.Analog.Basic.Ground ground "Ground";

  Modelica.Electrical.Analog.Basic.VoltageSourceAC voltageSource(
    V=vNominal, 
    f=fNominal) "AC voltage source";

  // Connections
  equation
    connect(voltageSource.p, squirrelCageMachine.plug_p) "Connect voltage source to machine";
    connect(squirrelCageMachine.plug_n, ground.p) "Connect machine to ground";
    connect(squirrelCageMachine.plug_p, loadResistor.p) "Connect machine to load resistor";
    connect(loadResistor.n, loadInductor.p) "Connect load resistor to load inductor";
    connect(loadInductor.n, ground.p) "Connect load inductor to ground";

end IMC_Transformer;