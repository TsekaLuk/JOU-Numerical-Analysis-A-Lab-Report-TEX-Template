%% 数值分析实验一：插值方法
% 作者：Tseka Luk
% 日期：2024-12-13
% 内容：拉格朗日插值与牛顿插值的实现与可视化

clear; clc; close all;

%% Problem 1: 二次拉格朗日插值
% 已知三组插值节点(1,2), (2,3)和(3,4)

% 定义插值节点
x1 = [1 2 3];
y1 = [2 3 4];

% 构造拉格朗日基函数
syms x;
l0 = ((x-x1(2))*(x-x1(3)))/((x1(1)-x1(2))*(x1(1)-x1(3)));
l1 = ((x-x1(1))*(x-x1(3)))/((x1(2)-x1(1))*(x1(2)-x1(3)));
l2 = ((x-x1(1))*(x-x1(2)))/((x1(3)-x1(1))*(x1(3)-x1(2)));

% 构造拉格朗日插值多项式
L = y1(1)*l0 + y1(2)*l1 + y1(3)*l2;
L = simplify(L);

% 将符号表达式转换为函数句柄
L_handle = matlabFunction(L);

% 创建图形并设置合适的大小
figure('Units', 'centimeters', 'Position', [2, 2, 20, 10]);

% 绘制拉格朗日插值结果
subplot(1,2,1);
fplot(L_handle, [0.5 3.5], 'b-', 'LineWidth', 1.5);
hold on;
plot(x1, y1, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
grid on;
xlabel('x');
ylabel('y');
title('拉格朗日二次插值');
legend('插值多项式', '插值节点', 'Location', 'best');

%% Problem 2: 二次牛顿插值
% 计算sqrt(115)，已知sqrt(100)=10, sqrt(121)=11, sqrt(144)=12

% 定义插值节点
x2 = [100 121 144];
y2 = [10 11 12];

% 计算一阶差商
f1_1 = (y2(2)-y2(1))/(x2(2)-x2(1));
f1_2 = (y2(3)-y2(2))/(x2(3)-x2(2));

% 计算二阶差商
f2 = (f1_2-f1_1)/(x2(3)-x2(1));

% 构造牛顿插值多项式
syms x;
N = y2(1) + f1_1*(x-x2(1)) + f2*(x-x2(1))*(x-x2(2));
N = simplify(N);

% 将符号表达式转换为函数句柄
N_handle = matlabFunction(N);

% 计算sqrt(115)的近似值
sqrt_115_approx = double(subs(N, x, 115));
fprintf('\nsqrt(115)的牛顿插值近似值为: %f\n', sqrt_115_approx);
fprintf('sqrt(115)的真实值为: %f\n', sqrt(115));
fprintf('绝对误差为: %e\n', abs(sqrt_115_approx-sqrt(115)));

% 绘制牛顿插值结果
subplot(1,2,2);
fplot(N_handle, [95 150], 'b-', 'LineWidth', 1.5);
hold on;
plot(x2, y2, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
plot(115, sqrt_115_approx, 'g*', 'MarkerSize', 10);
fplot(@(x) sqrt(x), [95 150], 'k--', 'LineWidth', 1);
grid on;
xlabel('x');
ylabel('y');
title('牛顿二次插值');
legend('插值多项式', '插值节点', 'sqrt(115)近似值', 'y=sqrt(x)', 'Location', 'best');

% 设置适当的纸张大小和位置
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [20 10]);
set(gcf, 'PaperPosition', [0 0 20 10]);

% 使用print命令保存高质量PDF
print('interpolation_results.pdf', '-dpdf', '-bestfit');