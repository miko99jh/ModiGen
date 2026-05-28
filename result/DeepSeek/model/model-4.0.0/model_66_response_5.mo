block Impedance extends Modelica.Blocks.Icons.Block;
  import Modelica.Constants;
  import Modelica.ComplexMath;
  import Modelica.Electrical.Batteries.ParameterRecords.TransientData.CellData;
  import Modelica.Blocks.Interfaces;
  import Modelica.ComplexBlocks.Interfaces;

  parameter CellData cellData;
  RealInput f(unit="Hz");
  ComplexOutput z(re=Modelica.Blocks.Interfaces.RealOutput, im=Modelica.Blocks.Interfaces.RealOutput);

equation
  z = Complex(cellData.R0, 0) + sum({1/Complex(1/cellData.rcData[k].R, 2*pi*f*cellData.rcData[k].C) for k in 1:cellData.nRC});
end Impedance;