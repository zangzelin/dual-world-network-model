clc 
clear all

% 本程序探究平均置信度与传播结果的关系

for pingjunzhixindu = 0.49:0.001:0.51
    %% 相关系数
    changdu = 500;                                                    %长度
    kuandu = 500;                                                     %宽度
    jiaoyoufanwei =10;                                                %交友范围
    pengyoushu =60;                                                   %交友数

    % pingjunzhixindu = 0.505;                                          %平均置信度
    zheangtai = 1/6;                                                  %

    tuidonglv = 0.3;                                                  %传媒推动力
    zhixinfazhi = 0.2;                                                %致信阈值

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
    oldcbqk = -1;

    while oldcbqk ~= newcbqk
    % 当传播还没有结束
        
        % 记录上次的结果
        jilu(count,:) = newcbqk;
        % imwrite(PP,[num2str(count),'.jpg']);% 保存图片
        % 模拟传播模型，进行两种观点的传播
        [net1, net2] = renjichuanbo2(changdu,kuandu,jiaoyoufanwei,frends, pengyoushu, net1,net2,0, 0,zhixinfazhi,zhixindu,0,0);
        % 记录原来的 情况
        oldcbqk = newcbqk;
        % 计算新的情况
        newcbqk = jilushuju(net1,net2,changdu,kuandu);
        % showpic;%
        
        count  = count +1;
    end

    csvwrite(['changepingjunzhixindu\history', num2str(pingjunzhixindu) ,'.csv'],jilu)
    % plot(history1)
    % hold on 
    % plot(history2)
    % history1
end

