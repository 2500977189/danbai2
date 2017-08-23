%8月21练习求解

%第6（2）题
global g;
global L;
g=9.8;
L=1;
num=50;
umax=linspace(pi/30,pi*5/12,num);
p0=sqrt(2*g*(1-cos(umax))/L);
opt=odeset('RelTol',1e-5,'AbsTol',1e-6);
T1=umax;
hold on
for k=1:num
    [t,up]=ode45(@ddanbai,[0,3],[0;p0(k)],opt);
    plot(t,up(:,1))
%    s1=find(up(:,1)>umax(k)/3);
%    s1=s1(1);
%    s2=find(up(:,1)<-umax(k)/3);
%   s2=s2(1);
%   T1(k)=spline(up(s1:s2,1),t(s1:s2),0)*2;
end
title('单摆运动 张开角度与时间图像')
hold off


figure
T=2*pi*sqrt(L/g);
hold on
for k=1:num
    t=0:0.02:T;
    u=umax(k)*sin(sqrt(g/L)*t);
    plot(t,u)
end
title('简谐振动 张开角度与时间图像')
hold off


%模拟单摆的运动过程
figure

umax=pi/3;
p0=sqrt(2*g*(1-cos(umax))/L);
Tmax=30;
axis equal
hold on
[t0,up]=ode45(@ddanbai,[0,Tmax],[0;p0],opt);
num=1200;
t=linspace(0,Tmax,num)
u=spline(t0,up(:,1),t);
plot([-L L],[0 0],'Color','black','LineWidth',8);
plot(0,0,'.k','MarkerSize',40);
h1=plot([0 0],[0 -L],'Color','Blue','LineWidth',2);
h2=plot(0,-L,'.b')
set(h1,'EraseMode','xor')
set(h2,'EraseMode','xor','MarkerSize',40)
for k=1:num
    drawnow
    u=up(k,1);
    x=L*sin(u);y=-L*cos(u);
    set(h1,'XData',[0 x],'YData',[0 y])
    set(h2,'XData',x,'YData',y)
    pause(0.01)
end
hold off
