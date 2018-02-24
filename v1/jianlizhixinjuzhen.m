function [ zhixindu ] = jianlizhixinjuzhen( pingjunzhixindu,zheangtai, changdu,kuandu)
% 函数用于建立描述节点对观点相信程度的置信矩阵
% 输入
% pingjunzhixindu：平均置信度，描述置信程度
% zheangtai：置信度的方差
% changdu：长度
% kuandu：宽度
% 输出
% zhixindu：置信度矩阵
    
    % 置信度矩阵的建立
    zhixindu= randn(changdu,kuandu)*zheangtai+pingjunzhixindu;

    % 处理不合理的数据
    for i = 1:changdu
        for j = 1:kuandu
            if zhixindu(i,j)>1
                zhixindu(i,j) = 1;
            end
            if  zhixindu(i,j)<0.005
                zhixindu(i,j) =0.005;
            end
        end
    end

end

