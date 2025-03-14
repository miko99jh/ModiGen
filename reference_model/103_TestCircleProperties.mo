model TestCircleProperties
  // 输入参数：圆的半径
  input Real r = 5 "Radius of the circle";

  // 输出结果：圆的周长和面积
  output Real circumference "Circumference of the circle";
  output Real area "Area of the circle";

equation
  // 调用 CircleProperties 函数计算圆的周长和面积
  circumference = CircleProperties1(radius=r);

end TestCircleProperties;
