%% 初始化参数
clc;
clear;
total = 1000; % 共切分1000个点，每个x向距离为1
hight = 1; % hight表示层数。暂时只研究一层
vv = 22; % 海浪速度
r=0.001; % 沙粒半径(0.0003~0.0015);
Gamma = 0.07; % 材料粘度
theta_d = 23.4; % 自然堆积的稳定角
step=0.005; % 优化步长
beta=0.2; % 拖曳力系数

global point;
point = zeros(total,3,hight); % 第2维分别表示x,y,坐标 
point(1:total,1,1) = 1:total; % 初始化x
point(1:total,2,1) = gety(total); % 由x计算y，初始设为圆形
point(1:total,3,1) = linspace(30,30,total); % 倾角（度）

%% 迭代
for tt = 1:200  %迭代200次
    
    %优化开始
    F = geogeo(total,vv,theta_d,beta);  %求在切平面上除了Fc外的合力
    fc = Fc(total,theta_d,r,Gamma);
    for x = 1:total-2 % 不迭代端点，因为导数没定义
        delta_f = mage(F(x,1:3)) - fc(x);
        %delta_f/fc(x)
        if delta_f > 0 %如果合力超过了fc的上限
            point(x,2,1) = max(point(x,2,1) - delta_f*step*(x/total)^2, 0); % y--
        end
    end
end    

plot(1:total-1,point(1:total-1,2,1));
plot(1:total-1,point(1:total-1,3,1));
