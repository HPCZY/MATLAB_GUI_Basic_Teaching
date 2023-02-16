
function GUI1()

Fig1 = figure('Position',[600,200,800,800],'menu','none');
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

end
    
    
    
    
    
    
    