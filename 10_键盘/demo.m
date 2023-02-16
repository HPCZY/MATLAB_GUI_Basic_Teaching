clear; close all; clc

GUI10();

function GUI10()

%% 搭框架
Fig = figure('Position',[600,500,1000,500],'menu','none',...
    'Color','white','NumberTitle','off','Name','GUI10');
set(Fig,'WindowKeyPressFcn',@KeyDown);
set(Fig,'WindowKeyReleaseFcn',@KeyUp);

% 绘图窗
Axes = axes(Fig,'Position',[0.1,0.1,0.8,0.8]);
axis(10*[-1,1,0,1]),grid on,hold on
plot([-20,20],[0,0],'k-','LineWidth',3,'Parent',Axes);

% 初始化
state = 0;
r = 1;
cir = DrawCircle(r);
p = [0,r];      % 当前位置
v = [0,0];      % 当前速度
dv = [5,10];    % 速度改变值
a = [0,0];      % 当前加速度
da = [-5,-20];  % 加速度改变值
H = plot(cir(:,1)+p(1),cir(:,2)+p(2),'r-','LineWidth',3,'Parent',Axes);
drawnow

%% 执行
dt = 0.01;
t = zeros(2,2);
while 1
   
    if isvalid(Axes)
        xalim = get(Axes,'xlim');
        yalim = get(Axes,'ylim');
    else
        break
    end

     if state
        % 速度检测
        tmp = v;
        v = v+a*dt;
        if (tmp(1)*v(1))<=0
            v(1) = 0;
        end
        % 落地碰撞检测
        p = p+v*dt;
        if p(2)<r
            p(2) = r;
            v(2) = 0;
        end
        if norm(v)==0
            state = 0;
        end
        H.XData = cir(:,1)+p(1);
        H.YData = cir(:,2)+p(2);
     end
    
    drawnow
end


    function KeyDown(~,~)
        pt = get(gcf,'CurrentCharacter');
        if strcmpi(pt,'a') % 左
            v(1) = -dv(1);
            a(1) = -da(1);
            state = 1;
        end
        if strcmpi(pt,'d') % 右
            v(1) = dv(1);
            a(1) = da(1);
            state = 1;
        end
        if strcmpi(pt,'w') % 上
            v(2) = dv(2);
            a(2) = da(2);
            state = 1;
        end
    end

    function KeyUp(~,~)
        pt = get(gcf,'CurrentCharacter');
        if strcmpi(pt,'a') % 左
            if t(1,1)==0
                t(1,1) = now;
            else
                t(1,2) = now;
                if (t(1,2)-t(1,1))*86400<0.5
                    p(1) = p(1)-dv(1)*0.5;
                    t(1,1) = 0;
                else
                    t(1,1) = t(1,2);
                end
            end
        end
        
        if strcmpi(pt,'d') % 右
            if t(2,1)==0
                t(2,1) = now;
            else
                t(2,2) = now;
                if (t(2,2)-t(2,1))*86400<0.5
                    p(1) = p(1)+dv(1)*0.5;
                    t(2,1) = 0;
                else
                    t(2,1) = t(2,2);
                end
            end
        end
        
    end

    function out = DrawCircle(r)
        t = 0:pi/16:2*pi;
        cx = r*cos(t');
        cy = r*sin(t');
        out = [cx,cy];
    end

end

