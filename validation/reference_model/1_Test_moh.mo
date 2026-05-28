model Test_moh1
  // ==========================================
  // 1. 静态测试：给几个固定的时间秒数算算看
  // ==========================================
  parameter Real test_t1 = 3600 + 15 * 60; // 1小时15分钟 (期望输出: 15)
  parameter Real test_t2 = 7200 + 45 * 60 + 30; // 2小时45分30秒 (期望输出: 45)
  
  Real result_t1 "Minute of test_t1";
  Real result_t2 "Minute of test_t2";

  // ==========================================
  // 2. 动态测试：跟着仿真时间(time)一起变
  // ==========================================
  Real dynamic_minute "Current minute based on simulation time";

equation
  // 调用静态测试
  result_t1 = moh1(test_t1); 
  result_t2 = moh1(test_t2); 

  // 调用动态测试：直接把全局变量 time 喂给它
  // 注意：如果您想测试带有初始时间偏移的情况，可以加上后面的参数，比如：
  // dynamic_minute = moh1(t=time, hour_start=8, min_start=30);
  dynamic_minute = moh1(time);

end Test_moh1;
