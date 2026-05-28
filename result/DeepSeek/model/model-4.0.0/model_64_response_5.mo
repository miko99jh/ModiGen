model CellStack
  extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    final parameter Modelica.SIunits.Resistance R = Ns*cellData.Ri/Np,
    redeclare parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData);
  Modelica.Electrical.Analog.Basic.Resistor r0(R = R);
equation 
  connect(r0.n, n);
end CellStack;