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

  Modelica.Electrical.Analog.Basic.Resistor loadResistor(
    R = 10) "Load resistor";

  Modelica.Electrical.Analog.Basic.Ground ground "Ground component";

  Modelica.Electrical.Analog.Basic.VoltageSourceAC voltageSource(
    V = V_nominal,
    freqHz = f_nominal) "AC voltage source";

  Modelica.Electrical.Analog.Basic.Transformer transformer(
    V1 = V_nominal,
    V2 = V_nominal / 2) "Transformer component";

  // Connections
  equation
    connect(voltageSource.p, transformer.p1);
    connect(transformer.n1, ground.p);
    connect(transformer.p2, imc.pin);
    connect(imc.pout, loadResistor.p);
    connect(loadResistor.n, ground.p);

end IMC_Transformer;