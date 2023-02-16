clear; close all; clc

GUI5()

function GUI5()

% 基本框架
Fig = figure('Position',[800,200,1000,800],'menu','none');

Pnl1 = uipanel(Fig,'Position',[0.1,0.1,0.2,0.8]);
Pnl2 = uipanel(Fig,'Position',[0.3,0.1,0.6,0.8]);

Bt = uicontrol(Pnl1,'style','pushbutton',...
    'String','选择数据集','Fontsize',16,...
    'Unit','normalized','Position',[0,0.9,1,0.1],...
    'Callback',@LoadData);

Lb = uicontrol(Pnl1,'style','listbox',...
    'String',[],'Fontsize',12,...
    'Unit','normalized','Position',[0,0.0,1,0.9],...
    'Callback',@Doit);

Axes = axes(Pnl2,'Position',[0,0,1,1]);

fileList = {};
fileNum = 0;
dataSet = {};

    function LoadData(~,~)
        folderPath = uigetdir('.\','请选择一个路径');
        fileList = dir(fullfile(folderPath,'*.jpg'));
        fileList = {fileList.name};
        fileNum = length(fileList);
        set(Lb,'String',fileList);        
        for n = 1:fileNum
            dataSet{n} = imread(fullfile(folderPath,fileList{n}));            
        end
        imshow(dataSet{1},'Parent',Axes)
    end

    function Doit(~,~)
        idx = get(Lb,'value');
        imshow(dataSet{idx},'Parent',Axes)
    end

end