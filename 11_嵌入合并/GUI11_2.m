function GUI11_2()
%% 主GUI界面
Fig = figure('Position',[800,300,600,600],'menu','none');
Fig.Color = 'white';
Fig.NumberTitle = 'off';
Fig.Name = '毕业答辩GUI';

Pnl1 = uipanel(Fig,'Position',[0.1,0.9,0.5,0.1]);
Pnl2 = uipanel(Fig,'Position',[0.1,0.05,0.8,0.8],'Visible','off');
Pnl3 = uipanel(Fig,'Position',[0.1,0.05,0.8,0.8],'Visible','off');

uicontrol(Pnl1,'style','pushbutton','String','算法流程演示','Fontsize',16,...
    'Units','normalized','Position',[0,0,0.5,1],'Callback',@Doit1);
uicontrol(Pnl1,'style','pushbutton','String','算法效果对比','Fontsize',16,...
    'Units','normalized','Position',[0.5,0,0.5,1],'Callback',@Doit2);

%% 子GUI界面
Pnl2_1 = uipanel(Pnl2,'Position',[0.1,0.17,0.8,0.7]);
Pnl2_2 = uipanel(Pnl2,'Position',[0.1,0.05,0.8,0.1]);
Axes2_1 = axes(Pnl2_1,'Position',[0,0,1,1]);
Bt2_1= uicontrol(Pnl2_2,'style','pushbutton','String','算法流程演示功能区','Fontsize',16,...
    'Units','normalized','Position',[0,0,1,1]);
plot(Axes2_1,rand(100,1))

Pnl3_1 = uipanel(Pnl3,'Position',[0.1,0.17,0.8,0.7]);
Pnl3_2 = uipanel(Pnl3,'Position',[0.1,0.05,0.8,0.1]);
Axes3_1 = axes(Pnl3_1,'Position',[0,0,1,1]);
Bt3_1= uicontrol(Pnl3_2,'style','pushbutton','String','算法效果对比功能区','Fontsize',16,...
    'Units','normalized','Position',[0,0,1,1]);
imshow(rand(100),'Parent',Axes3_1)


    function Doit1(~,~)
        set(Pnl2,'Visible','on')
        set(Pnl3,'Visible','off')
    end

    function Doit2(~,~)
        set(Pnl3,'Visible','on')
        set(Pnl2,'Visible','off')
    end


end