model DCVoltageFactor
extends factorY2DC;
  // 输入参数：相数 m
  input Integer m=3 "Number of phases";
  
  // 输出结果：DC 电压因子
  output Real y "Factor of RMS Y-voltage to DC";
 equation
  // 调用函数 factorY2DC 计算 Y 电压到 DC 的因子
  y = factorY2DC(m=m);
end DCVoltageFactor;
