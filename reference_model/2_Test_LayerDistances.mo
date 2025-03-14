model Test_LayerDistances
  // 输入参数：各层的厚度
  input Real s[:] = {1.0, 2.0, 3.0}"Layer thicknesses";
  // 输出结果：各层的 face-centres-face 距离
  output Real d[:];
  // 设置 layer 厚度值并显示结果
equation
   size(d, 1) = size(s, 1) + 1;
  // 调用 layer_fcf_distances 函数计算 face-centres-face 距离
  d = layer_fcf_distances(s=s);
  // 打印输出计算结果
  annotation (Experiment(Visibility=Visible));
end Test_LayerDistances;
