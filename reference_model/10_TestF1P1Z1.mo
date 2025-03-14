model TestF1P1Z1
  // 输入参数：各个参数的初始值
  input Real alfa = 0.5 "Discretization parameter";
  input Real T1 = 1.0 "Zero";
  input Real T2 = 2.0 "Pole";
  input Real u = 1.0 "Current input";
  input Real u_pre = 0.5 "Previous input";
  input Real y_pre = 0.2 "Previous output";
  input Real Ts = 0.1 "Sampling time";
  input Real k = 1.5 "Gain";
  
  // 输出结果：计算的输出 y
  output Real y "Output of the function";
equation
  // 调用 f1p1z1 函数计算输出 y
  y = f1p1z1(alfa=alfa, T1=T1, T2=T2, u=u, u_pre=u_pre, y_pre=y_pre, Ts=Ts, k=k);

  // 用于显示和测试结果
  annotation (Experiment(Visibility=Visible));
end TestF1P1Z1;
