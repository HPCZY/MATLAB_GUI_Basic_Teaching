
function GUI8()

% ¿ò¼Ü
Fig1 = figure('Position',[400,600,300,400],'menu','none');
Fig1.Color = 'white';
Fig1.NumberTitle = 'off';
Fig1.Name = 'GUI8';
% °´Å¥
num = 8;
for n = 1:num
        p = [0.05,1-n/num,0.9,1/num];
        Bt{n} = uicontrol(Fig1,'style','pushbutton',...
                     'String',['ÔËÐÐGUI',num2str(n)],'Fontsize',16,...
                     'Units','normalized','Position',p);
end
Bt{1}.Callback = @Doit1;
Bt{2}.Callback = @Doit2;
Bt{3}.Callback = @Doit3;
Bt{4}.Callback = @Doit4;
Bt{5}.Callback = @Doit5;
Bt{6}.Callback = @Doit6;
Bt{7}.Callback = @Doit7;
Bt{8}.Callback = @Doit8;

    function Doit1(~,~)
        GUI1();
    end
    function Doit2(~,~)
        GUI2();
    end
    function Doit3(~,~)
        GUI3();
    end
    function Doit4(~,~)
        GUI4();
    end
    function Doit5(~,~)
        GUI5();
    end
    function Doit6(~,~)
        GUI6();
    end
    function Doit7(~,~)
        GUI7();
    end
    function Doit8(~,~)
        close all
        GUI8();
    end

end
