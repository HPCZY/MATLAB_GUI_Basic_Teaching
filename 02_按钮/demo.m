clear; close all; clc

GUI2()

function GUI2()

Fig = figure('Position',[700,200,600,600],'menu','none');
Fig.Color = 'white';
Fig.NumberTitle = 'off';
Fig.Name = 'GUI1';

Pnl1 = uipanel(Fig,'Position',[0.1,0.17,0.8,0.8]);
Pnl2 = uipanel(Fig,'Position',[0.1,0.05,0.8,0.1]);

Axes = axes(Pnl1,'Position',[0,0,1,1]);

Bt1= uicontrol(Pnl2,'style','pushbutton','String','请解锁','Fontsize',16,...
    'Units','normalized','Position',[0,0,0.5,1],'Callback',@ChangeColor);
Bt2 = uicontrol(Pnl2,'style','togglebutton','String','解锁','Fontsize',16,...
    'Units','normalized','Position',[0.5,0,0.5,1],'Callback',@Lock);

state = 0;
im = ones(100,100,3);
imshow(im,'Parent',Axes)

    function ChangeColor(~,~)
        if state
            rgb = rand(1,1,3);
            imnew = im.*rgb;
            imshow(imnew,'Parent',Axes)
        end
    end

    function Lock(~,~)
        state = get(Bt2,'Value');
        if state
            set(Bt2,'String','锁定')
            set(Bt1,'String','更改颜色')
        else
            set(Bt2,'String','解锁')
            set(Bt1,'String','请解锁')
        end
    end







end