clear; close all; clc

im = imread('test.jpg');

GUI4(im)

function GUI4(im)

Fig = figure('Position',[500,200,1400,800],'menu','none');
Fig.Color = 'white';
Fig.NumberTitle = 'off';
Fig.Name = 'GUI1';

% 面板
Pnl1 = uipanel(Fig,'Position',[0.1,0.25,0.8,0.7]);
Pnl2 = uipanel(Fig,'Position',[0.1,0.05,0.8,0.1]);

% 下拉按钮
sizeList = {[1,1],[1,2],[2,2],[2,4]};
for s = 1:length(sizeList)
    menuList{s} = strcat(num2str(sizeList{s}(1)),'*',num2str(sizeList{s}(2)));
end
Menu = uicontrol(Pnl2,'style','popupmenu',...
    'String',menuList,'Fontsize',16,...
    'Units','normalized','Position',[0,0,1,1],...
    'Callback',@GenerateAxes);

% 绘图窗初始化
Axes = [];
axesNum = 0;
GenerateAxes();

    function GenerateAxes(~,~)
        tmp = get(Menu,'Value');
        
        for n = 1:axesNum
           delete(Axes{n}) 
        end
        Axes = [];
        
        row = sizeList{tmp}(1);
        col = sizeList{tmp}(2);
        for r = 1:row
            for c = 1:col
                idx = (r-1)*col+c;
                Axes{idx} = axes(Pnl1,'Position',[(c-1)/col,1-r/row,1/col,1/row]);
            end
        end
        axesNum = length(Axes);
        updata();
    end

    function updata()
       for n = 1:axesNum
           imshow(im,'Parent',Axes{n})
       end
    end

end