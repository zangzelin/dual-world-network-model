function [frends] = jianliwangluo( changdu,kuandu,jiaoyoufanwei,pengyoushu )
% 函数用于双世界网络模拟竞争传播中建立双世界网络的拓扑结构
% 输入：
% changdu：仿真区域的长度
% kuandu：仿真区域的宽度
% jiaoyoufanwei：网络中地理因素对关系因素的限制
% pengyoushu：网络中维持关系的数量
% 输出：
% net：输出节点对某一问题的态度，0表示不接受，1表示接受
% frends：关系矩阵，描述网络中朋友关系的矩阵



% 根据交友范围建立朋友表
pengyoubiao = makepengyoubiao(jiaoyoufanwei);

% 遍历长度和宽度范围
for i = jiaoyoufanwei:1:changdu-jiaoyoufanwei-1
    for j =  jiaoyoufanwei:1:kuandu-jiaoyoufanwei-1
        
        pengyou = zeros(pengyoushu,2); % 初始化朋友矩阵
        jiluadd = zeros(1,pengyoushu)+0.1; % 
        
        % 朋友的候选人的数量计算，按照菱形区域计算
        kenengpengyoushu = 2*(jiaoyoufanwei-1)*(jiaoyoufanwei-1)+2*(jiaoyoufanwei-1)+1;
        % 建立候选人数量这么多的随机数，也就是对所有的候选人进行编号
        jianli_suishuadd = randperm(kenengpengyoushu);
        % 选取这么多的朋友用来运算，进行随机的选取
        shiyong = jianli_suishuadd(1:pengyoushu);
        
        % 对所以有的朋友进行遍历
        for k = 1:pengyoushu
            % 填充朋友矩阵 
            pengyou(k,:) =[pengyoubiao(shiyong(k),1)+i,j-pengyoubiao(shiyong(k),2)] ;
        end
        
        frends{i,j} = pengyou;
    end
  
end



   