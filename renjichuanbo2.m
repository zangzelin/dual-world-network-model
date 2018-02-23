% 初始化转移矩阵
net0= zeros(changdu,kuandu);

for i = jiaoyoufanwei:1:changdu-jiaoyoufanwei-1
    for j =  jiaoyoufanwei:1:kuandu-jiaoyoufanwei-1
    % 在有小范围内进行遍历

        % 提取该点朋友关系矩阵    
        aim = frends{i,j};
        % 初始化两种观点相信的数量
        zdd1 = 0;zdd2 = 0;
        for k = 1:pengyoushu
        % 遍历所有的朋友节点
            % 如果 该节点相信 1
            if( net1(aim(k,1),aim(k,2)) == 1)
                % 如果是亲近节点，那么话语权更高
                if k<0.3*pengyoushu
                    zdd1 = zdd1+2;
                % 如果不是是亲近节点，那么话语权一般
                else
                    zdd1 = zdd1+1;
                end
            end

            % 如果 该节点相信 2
            if( net2(aim(k,1),aim(k,2)) == 1)
                % 如果是亲近节点，那么话语权更高                
                if k<0.3*pengyoushu
                    zdd2 = zdd2+2;
                % 如果不是是亲近节点，那么话语权一般
                else
                    zdd2 = zdd2+1;
                end
            end
        end
        
        % 计算两种观点的相信情况
        zhouweizxd1 = zdd1/(pengyoushu);
        zhouweizxd2 = zdd2/(pengyoushu);

        % 更新转移矩阵
        if net1(i,j) == 0 && net2(i,j) == 0
            if( zhouweizxd1> zhixinfazhi && zhouweizxd1>zhouweizxd2)
                net0(i,j) = 1;
            end
            if(zhouweizxd2> zhixinfazhi && zhouweizxd2>zhouweizxd1 )
                net0(i,j) =-1;
            end
        end    
        if net1(i,j) == 1 && net2(i,j) == 0
                    if(zhouweizxd2>0.7 )
                        net0(i,j) =-1;
                    end
        end
        if net1(i,j) == 0 && net2(i,j) == 1
            if(zhouweizxd1> 0.7 )
                net0(i,j) = 1;
            end
        end

     end
end

% 通过转移矩阵更改相信矩阵
for i = jiaoyoufanwei:1:changdu-jiaoyoufanwei-1
    for j =  jiaoyoufanwei:1:kuandu-jiaoyoufanwei-1
    if  net0(i,j) == 1
        net1(i,j) =1;
        net2(i,j) =0;
    end
      if  net0(i,j) == -1
        net1(i,j) =0;
        net2(i,j) =1;
    end
    end
end

 