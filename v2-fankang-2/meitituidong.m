function [ net ] = meitituidong(zhixindu,net, starx,stary,endx,endy,tuidonglv,mod )
% 媒体推动部份，在信息传播前，需要媒体对传播进行推动，给与信息传播的初始动力
% 输入：
% zhixindu：置信度矩阵，代表了各个节点接受信息的容易程度
% net：相信矩阵，代表了各个节点的相信情况
% starx：开始位置x
% stary：开始位置ys
% endx：结束位置x
% endy：结束位置y
% tuidonglv：推动率，描述媒体推动的力量
% mod ：推动模式

if mod == 1
    %  在模式1下，挑选置信度小于推动力的节点相信
    for i = starx:endx
        for j = stary:endy
            if  zhixindu(i,j)<tuidonglv
                net(i,j) =1;
            end
        end
    end
else
    %  在模式2下，挑选置信度大于（1-推动力）的节点相信
    for i = starx:endx
        for j = stary:endy
            if  zhixindu(i,j)>1-tuidonglv
                net(i,j) =1;
            end
        end
    end
end
    

end
