function [error,jilu] = returnerror(fankang1,changdu,kuandu,jiaoyoufanwei,pengyoushu,pingjunzhixindu,zheangtai,tuidonglv,data,zhixinfazhi)
%returnerror - Description
%
% Syntax: jilu = returnerror(fankang1,changdu,kuandu,jiaoyoufanwei,pengyoushu,pingjunzhixindu,zheangtai,tuidonglv,data)
%
% Long description
    fankang2 = fankang1;
            
    %% 传播情况记录变量初始化
    history1 = 0;
    history2 = 0;

    %% 建立网络和置信矩阵

    % 建立网络中的朋友关系
    [frends] = jianliwangluo( changdu,kuandu,jiaoyoufanwei,pengyoushu );
    % 建立置信度矩阵，描述每个节点对观点的相信程度
    zhixindu= jianlizhixinjuzhen( pingjunzhixindu,zheangtai, changdu,kuandu);

    % 传媒的第一次推动，相信程度的初始化
    % 初始化两种观点的相信矩阵
    net1 = zeros(changdu,kuandu);net2 = zeros(changdu,kuandu);
    % 媒体推动
    net1 = meitituidong(zhixindu,net1,1,1,500,500,tuidonglv,1);
    net2 = meitituidong(zhixindu,net2,1,1,500,500,tuidonglv,2);

    % 展示画布
    % showpic;
    % 记录数据
    newcbqk = jilushuju(net1,net2,changdu,kuandu);

    %% 新闻的传递

    % 传播的次数指针初始化
    count = 1;
    % 传播百分比情况初始化
    oldcbqk = [-1 -1];

    Adown = 0;
    Bdown = 0;


    for loop = 1:length(data)
    % 当传播还没有结束
        
        % 记录上次的结果
        jilu(count,:) = newcbqk;
        % imwrite(PP,[num2str(count),'.jpg']);% 保存图片
        % 模拟传播模型，进行两种观点的传播
        renjichuanbo2;
        
        % 判断A观点或者B观点的信徒正在收缩
        if newcbqk(1) < oldcbqk(1)
            Adown = 1;
        else
            Adown = 0;
        end
        if newcbqk(2) < oldcbqk(2)
            Bdown = 1;
        else
            Bdown = 0;
        end
        
        % 记录原来的 情况
        oldcbqk = newcbqk;
        % 计算新的情况
        newcbqk = jilushuju(net1,net2,changdu,kuandu);
        % showpic;%
        
        
        count  = count +1;
    end

    % 将计算的数据归一化
    for i = 1:length(jilu)
        sum1 = jilu(i,1)+jilu(i,2);
        jilu(i,1) = jilu(i,1)/sum1;
        jilu(i,2) = jilu(i,2)/sum1;
    end

    % 计算误差
    error = sum(sum(abs( jilu - data )));
end
            