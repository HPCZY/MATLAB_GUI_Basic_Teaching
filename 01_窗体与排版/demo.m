clear; close all; clc

GUI();

function GUI()

Fig1 = figure('Position',[100,100,400,400],'menu','none');
Fig1.Color = 'white';
Fig1.NumberTitle = 'off';
Fig1.Name = 'GUI1';

Pnl1 = uipanel(Fig1,'Position',[0.1,0.5,0.8,0.45]);
Pnl2 = uipanel(Fig1,'Position',[0.1,0.05,0.8,0.45]);

Axes1 = axes(Pnl1,'Position',[0.1,0.1,0.4,0.8]);
Axes2 = axes(Pnl1,'Position',[0.5,0.1,0.4,0.8]);

Axes3 = axes(Pnl2,'Position',[0.1,0.1,0.4,0.8]);
Axes4 = axes(Pnl2,'Position',[0.5,0.1,0.4,0.8]);

x = 1:100;
y = x*2;
im = rand(100);
imrgb = rand(100,100,3);

plot(Axes1,x,y,'b')
plot(Axes2,x,y,'r')
imshow(im,'Parent',Axes3)
imshow(imrgb,'Parent',Axes4)









Fig2 = figure('Position',[600,100,400,400],'menu','none');
Fig2.Color = 'white';
Fig2.NumberTitle = 'off';
Fig2.Name = 'GUI2';

idx = 0;
for i = 1:3
    for j = 1:3
        idx = idx+1;
        p = [(i-1)*0.33,(j-1)*0.33,0.33,0.33];
        AxesList{idx} = axes(Fig2,'Position',p);
    end
end


t = 0:0.01:2*pi;
for n = 1:9
    y = sin(t*n);
    plot(AxesList{n},t,y);
end




end
    
    
    
    
    
    
    