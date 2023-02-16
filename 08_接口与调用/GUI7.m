
function GUI7()

% 主界面
Fig = figure('Position',[500,200,900,600],'menu','none');
Fig.Color = 'white';
Fig.NumberTitle = 'off';
Fig.Name = 'GUI7';

% 历史记录
Pnl1 = uipanel(Fig,'Position',[0.05,0.5,0.9,0.5],...
    'Title','历史记录','Fontsize',14,'BackgroundColor','w');
% 骚操作
Pnl2 = uipanel(Fig,'Position',[0.05,0.05,0.9,0.4],...
    'Title','人工输入','Fontsize',14,'BackgroundColor','w');

% 文本框
str1 = {'欢迎使用'};
Text = uicontrol(Pnl1,'style','text',...
             'String',str1,'Fontsize',16,...
             'Units','normalized','Position',[0.05,0.05,0.9,0.9]);
% 编辑框
str2 = '请输入你想要的的内容';
Edit = uicontrol(Pnl2,'style','edit',...
    'String',str2,'Fontsize',16,...
    'Units','normalized','Position',[0.05,0.05,0.6,0.9]);

% 按钮
Bt = cell(3,1);
BtNameList = {'增加','替换','清除'};
for n = 1:3
Bt{n} = uicontrol(Pnl2,'style','pushbutton',...
            'String',BtNameList{n},'Fontsize',16,...
            'Units','normalized','Position',[0.7,0.95-n*0.3,0.25,0.3]);
end

Bt{1}.Callback = @doit1;
Bt{2}.Callback = @doit2;
Bt{3}.Callback = @doit3;

    function doit1(~,~)
        tmp = get(Edit,'String');
        str1 = cat(1,str1,{tmp});
        set(Text,'String',str1);
        set(Edit,'String','');
    end

    function doit2(~,~)
        tmp = get(Edit,'String');
        str1 = {tmp};
        set(Text,'String',str1);
        set(Edit,'String','');
    end

    function doit3(~,~)
        str1 = {};
        set(Text,'String',str1);
        set(Edit,'String','');
    end


end