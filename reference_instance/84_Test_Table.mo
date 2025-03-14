model Test_Table
  IDEAS.Controls.SetPoints.Table tableOnFile(
    table=[20,0; 22,0.5; 25,0.5; 26,1]);
  Modelica.Blocks.Sources.Ramp ramp(
    duration=1,
    offset=15,
    height=15);
equation
  connect(ramp.y, tableOnFile.u);
end Test_Table;
