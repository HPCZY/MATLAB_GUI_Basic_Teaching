function Fig = GUI1()
Fig = figure('Position',[800,300,600,600],'menu','none');
Fig.Color = 'white';
Fig.NumberTitle = 'off';
Fig.Name = '算法流程演示';

Pnl1 = uipanel(Fig,'Position',[0.1,0.17,0.8,0.7]);
Pnl2 = uipanel(Fig,'Position',[0.1,0.05,0.8,0.1]);

Axes1 = axes(Pnl1,'Position',[0,0,1,1]);
Bt1= uicontrol(Pnl2,'style','pushbutton','String','算法流程演示功能区','Fontsize',16,...
    'Units','normalized','Position',[0,0,1,1]);
plot(Axes1,rand(100,1))

end