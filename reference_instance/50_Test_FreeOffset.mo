model Test_FreeOffset1
  PowerGrids.Controls.FreeOffset freeOffset1(use_u = false, fixedOffset = true);
  PowerGrids.Controls.FreeOffset freeOffset2(use_u = true);
  Modelica.Blocks.Sources.Sine Sine(f=1);
equation
  connect(Sine.y,freeOffset1.u);
  connect(Sine.y,freeOffset2.u);
end Test_FreeOffset1;
