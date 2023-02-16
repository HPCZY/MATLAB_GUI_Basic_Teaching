
function GUI6()

%% 搭框架
Fig = figure('Position',[800,100,800,900],'menu','none');
Fig.Color = 'white';
Fig.NumberTitle = 'off';
Fig.Name = 'GUI6';
% 面板
Pnl1 = uipanel(Fig,'Position',[0.05,0.2,0.9,0.75]);
Pnl2 = uipanel(Fig,'Position',[0.05,0.05,0.9,0.1]);
% 绘图窗
Axes = axes(Pnl1,'Position',[0.1,0.1,0.9,0.9]);
Lbx = uicontrol(Pnl1,'style','slider',...
    'String',[],'Fontsize',12,...
    'Unit','normalized','Position',[0.1,0,0.9,0.05],...
    'Max',1,'Min',-1,...
    'Callback',@Move);
Lby = uicontrol(Pnl1,'style','slider',...
    'String',[],'Fontsize',12,...
    'Unit','normalized','Position',[0,0.1,0.05,0.9],...
    'Max',1,'Min',-1,...
    'Callback',@Move);  

% 操作窗
uicontrol(Pnl2,'style','pushbutton',...
    'String','红方用力','Fontsize',16,'BackgroundColor',[1,0.5,0.5],...
    'Unit','normalized','Position',[0,0,0.2,1],...
    'Callback',@Pull1);
uicontrol(Pnl2,'style','pushbutton',...
    'String','蓝方用力','Fontsize',16,'BackgroundColor',[0.5,0.5,1],...
    'Unit','normalized','Position',[0.8,0,0.2,1],...
    'Callback',@Pull2);
Lb = uicontrol(Pnl2,'style','slider',...
    'String',[],'Fontsize',12,...
    'Unit','normalized','Position',[0.2,0.,0.6,1],...
    'Max',1,'Min',-1); 


%% 初始化
%  初始化目标
plot(-1,0,'ro','MarkerSize',30,'Parent',Axes),hold on
plot(1,0,'bo','MarkerSize',30,'Parent',Axes)
plot([-1,1],[0,0],'k-')
obj = plot(0,0,'k.','MarkerSize',30,'Parent',Axes);
% 初始化坐标轴
range = [-1.2,1.2,-1,1];
axis(Axes,range)
grid on

%% 开始操作吧
while true
    dis = randi([-3,3])/50;
    obj.XData = min(max(obj.XData+dis,-1),1);
    set(Lb,'Value',obj.XData)            
    % 你慢一点
    pause(0.1)
    drawnow
    % 你们别打啦
    if abs(obj.XData)==1
        break
    end
    
end

%% 子函数
    function Move(~,~)
        xids = get(Lbx,'Value');
        yids = get(Lby,'Value');
        change = [xids,xids,yids,yids];
        axis(Axes,range+change)        
    end

    function Pull1(~,~)
        obj.XData = max(obj.XData-0.2,-1);
        set(Lb,'Value',obj.XData);
    end

    function Pull2(~,~)
        obj.XData = min(obj.XData+0.2,1);
        set(Lb,'Value',obj.XData);
    end

end