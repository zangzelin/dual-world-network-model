function out = importantpoint(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, net1, net2, fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown,blockchangdu,blockkuandu,side)
% ???????????????????????
% net1, ?????????? 
% net2, ??????????
% zhixindu, ??????
% changdu, ???????
% kuandu, ???????
% blockchangdu, ???????
% blockkuandu, ???????
% side ????1????????

[ basicpersentange1, basicpersentange2] = returnpersantage(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, net1, net2, fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown);

M_persentage2 = zeros(floor(changdu)+1,floor(kuandu)+1);
M_persentage1 = zeros(changdu+1,kuandu+1);

if side == 1
    for zzli = 1: 1:changdu
        for j = 1:1:kuandu

            newnet = net1;
            newnet( zzli:zzli+blockchangdu,j:j+blockkuandu ) = 1;

            [ persentange1, persentange2] = returnpersantage(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, newnet, net2, fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown);

            M_persentage1( zzli ,j) = persentange1;
            [zzli, j]
        end
    end

    out = M_persentage1;
else
    for zzli = 1: 1:changdu
        for j = 1:1:kuandu

            newnet = net2;
            newnet( zzli:zzli+blockchangdu,j:j+blockkuandu ) = 1;

            [ persentange1, persentange2] = returnpersantage(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, net1,newnet,  fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown);

            M_persentage2( zzli , j ) = persentange2;

        end
    end
    out = M_persentage2;    
end



end