model Test_layer_fcf_distances
  // 1. 定义输入参数：假设我们有 3 层材料，厚度分别是 0.2, 0.4, 0.6
  parameter Real test_s[3] = {0.2, 0.4, 0.6} "Test layer thicknesses";
  
  // 2. 声明一个变量来接收计算结果。
  // 注意：根据函数定义，输出数组的长度是 输入长度 + 1（即 3 + 1 = 4）
  Real test_d[4] "Resulting distances";

equation
  // 3. 完美避开报错的核心操作：在方程区直接“调用”函数！
  test_d = layer_fcf_distances(test_s);

end Test_layer_fcf_distances;
