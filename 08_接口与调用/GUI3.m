
function GUI3()

im = ones(100,100,3);

Fig = figure('Position',[500,200,900,600],'menu','none');
Fig.Color = 'white';
Fig.NumberTitle = 'off';
Fig.Name = 'GUI3';

% 绘图面板
Pnl1 = uipanel(Fig,'Position',[0.05,0.35,0.9,0.6],...
    'Title','绘图窗口','Fontsize',14);
% 选项面板框
Pnl2 = uipanel(Fig,'Position',[0.05,0.05,0.3,0.3],...
    'Title','复选框','Fontsize',14);
Pnl3 = uipanel(Fig,'Position',[0.35,0.05,0.3,0.3],...
    'Title','单选框','Fontsize',14);
% 按钮组
Pnl4 = uibuttongroup (Fig,'Position',[0.65,0.05,0.3,0.3],...
    'Title','单选框组','Fontsize',14);

Axes1 = axes(Pnl1,'Position',[0,0,1/3,1]);
Axes2 = axes(Pnl1,'Position',[1/3,0,1/3,1]);
Axes3 = axes(Pnl1,'Position',[2/3,0,1/3,1]);

checkBoxList = {'红','绿','蓝'};
colorList = {[1,0.6,0.6],[0.6,1,0.6],[0.6,0.6,1]};
BtGroup1 = cell(3,1);
for n = 1:3
    BtGroup1{n} = uicontrol(Pnl2,'style','checkbox',...
        'String',checkBoxList{n},'Fontsize',16,'BackgroundColor',colorList{n},...
        'Units','normalized','Position',[0.2,1-n/3,0.6,1/3],...
        'Callback',@ChangeColor1);
end

BtGroup2 = cell(3,1);
for n = 1:3
    BtGroup2{n} = uicontrol(Pnl3,'style','radiobutton',...
        'String',checkBoxList{n},'Fontsize',16,'BackgroundColor',colorList{n},...
        'Units','normalized','Position',[0.2,1-n/3,0.6,1/3],...
        'Callback',@ChangeColor2);
end

BtGroup3 = cell(3,1);
for n = 1:3
    BtGroup3{n} = uicontrol(Pnl4,'style','radiobutton',...
        'String',checkBoxList{n},'Fontsize',16,'BackgroundColor',colorList{n},...
        'Units','normalized','Position',[0.2,1-n/3,0.6,1/3],...
        'Callback',@ChangeColor3);
end

% 初始化
ChangeColor1()
ChangeColor2()
ChangeColor3()

    function ChangeColor1(~,~)
        rgb = zeros(1,1,3);
        for i = 1:3
            rgb(i) = get(BtGroup1{i},'Value');
        end
        imnew = im.*rgb;
        imshow(imnew,'Parent',Axes1);
    end

    function ChangeColor2(~,~)
        rgb = zeros(1,1,3);
        for i = 1:3
            rgb(i) = get(BtGroup2{i},'Value');
        end
        imnew = im.*rgb;
        imshow(imnew,'Parent',Axes2);
    end

    function ChangeColor3(~,~)
        rgb = zeros(1,1,3);
        for i = 1:3
            rgb(i) = get(BtGroup3{i},'Value');
        end
        imnew = im.*rgb;
        imshow(imnew,'Parent',Axes3);
    end

end