function [pengyoubiao] = makepengyoubiao(jiaoyoufanwei)

meihang = 0;
zonggong= 0;
add = -1;
for i = 1: jiaoyoufanwei*2-1
    if i<=jiaoyoufanwei
         add = add+2;
         meihang(i) =add;
         zonggong(i+1) = zonggong(i)+meihang(i);
    else
        add = add-2;
        meihang(i) =add ;
        zonggong(i+1) = zonggong(i)+meihang(i);
    end
end

fenceng = zonggong(2:length(zonggong));
%
for jianli_suishuadd =1:2*(jiaoyoufanwei-1)*(jiaoyoufanwei-1)+2*(jiaoyoufanwei-1)+1
    for c = 1:2*jiaoyoufanwei-1
        if jianli_suishuadd<=fenceng(c);
            break;
        end
    end
    pengyoubiao(jianli_suishuadd,:) = [floor(meihang(c)/2)+jianli_suishuadd-fenceng(c) ,jiaoyoufanwei-c  ];
end