clc 
clear all

% 在duicong的基础上，使用最优化法寻找最优参数的程序
% 加入了反抗因素

%% 相关系数
changdu = 500;                                                    %长度
kuandu = 500;                                                     %宽度
jiaoyoufanwei =10;                                                %交友范围
pengyoushu =60;                                                   %交友数
zheangtai = 1/6;                                                  %
tuidonglv = 0.3;                                                  %传媒推动力
zhixinfazhi = 0.2;                                                %致信阈值



% 寻找的最优参数如下
pingjunzhixindu = 0.5005;                                          %平均置信度
fankang1 = 0.2;
fankang2 = 0.2;

% 导入数据

data = loadprecidentdata2012();

% 初始化总体误差
errorabove = 100;
bestpingjunzhixindu = -1;
bestfankang1 = -1;

% 初始化step
pingjunzhixindustep = 0.001;
fankangstep = 0.01;

zzl = 100;
while zzl ~= 1
            
    [errorbestpingjunzhixinduadd,jilu] =  subzuixiao(fankang1,changdu,kuandu,jiaoyoufanwei,pengyoushu, pingjunzhixindu + pingjunzhixindustep ,zheangtai,tuidonglv,data,zhixinfazhi);

    [errorbestpingjunzhixindumun,jilu] =  subzuixiao(fankang1,changdu,kuandu,jiaoyoufanwei,pengyoushu, pingjunzhixindu - pingjunzhixindustep ,zheangtai,tuidonglv,data,zhixinfazhi);
    
    [errorbestfankangadd,jilu] =  subzuixiao(fankang1 + fankangstep ,changdu,kuandu,jiaoyoufanwei,pengyoushu, pingjunzhixindu ,zheangtai,tuidonglv,data,zhixinfazhi);

    [errorbestfankangmun,jilu] =  subzuixiao(fankang1 - fankangstep,changdu,kuandu,jiaoyoufanwei,pengyoushu, pingjunzhixindu ,zheangtai,tuidonglv,data,zhixinfazhi);
    
    % 如果误差下降了，更新保存的参数；    
    if errorbestpingjunzhixinduadd < errorabove
        errorabove = errorbestpingjunzhixinduadd;
        pingjunzhixindu = pingjunzhixindu + pingjunzhixindustep;
        bestresult = jilu;
    elseif errorbestpingjunzhixindumun < errorabove
        errorabove = errorbestpingjunzhixindumun;
        pingjunzhixindu = pingjunzhixindu - pingjunzhixindustep;        
        bestresult = jilu;
    elseif errorbestfankangadd < errorabove
        errorabove = errorbestfankangadd;
        fankang1 = fankang1 + fankangstep;
        bestresult = jilu;
    elseif errorbestfankangmun < errorabove
        errorabove = errorbestfankangmun;
        fankang1 = fankang1 - fankangstep;
        bestresult = jilu;
    end
    

    [ 'error__','bestpingjunzhixindu__', 'bestfankang1', num2str(errorabove),'__' ,num2str(pingjunzhixindu),'__',num2str(fankang1)]


    zzl = zzl-1;

end

plot(bestresult)
hold on 
plot(data)

% csvwrite('history1.csv',jilu)
% plot(history1)
% hold on 
% plot(history2)
% history1