model Test_Mean
  // 输入：一组数据，包含多个数值
  input Real u[5] = {1.0, 2.0, 3.0, 4.0, 5.0};  // 示例输入数据
  // 输出：计算的平均值
  output Real y;
  
equation
  // 调用 Mean1 函数来计算输入数组 u 的平均值
  y = Mean(u=u);
  // 用于显示输出结果
  annotation (Experiment(Visibility=Visible));
end Test_Mean;
