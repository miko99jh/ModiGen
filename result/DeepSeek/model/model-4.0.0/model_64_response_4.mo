model CellStack
  extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    redeclare final parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData,
    final parameter Real R = Ns*cellData.Ri/Np,
    final parameter Real r0.R = R
  );
  Modelica.Electrical.Analog.Basic.Resistor r0(R = R);
equation 
  connect(r0.n, n);
end CellStack;