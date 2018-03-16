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

M_persentage2 = zeros(floor(changdu/blockchangdu)+1,floor(kuandu/blockkuandu)+1);
M_persentage1 = zeros(changdu/blockchangdu+1,kuandu/blockkuandu+1);

if side == 1
    for zzli = 1: blockchangdu:changdu
        for j = 1:blockkuandu:kuandu

            newnet = net1;
            newnet( zzli:zzli+blockchangdu,j:j+blockkuandu ) = 1;

            [ persentange1, persentange2] = returnpersantage(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, newnet, net2, fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown);

            M_persentage1( floor(zzli/blockchangdu) + 1,floor(j/blockkuandu) +1) = persentange1;
            [zzli, j]
        end
    end

    out = M_persentage1;
else
    for zzli = 1: blockchangdu:changdu
        for j = 1:blockkuandu:kuandu

            newnet = net2;
            newnet( zzli:zzli+blockchangdu,j:j+blockkuandu ) = 1;

            [ persentange1, persentange2] = returnpersantage(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, net1,newnet,  fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown);

            M_persentage2( floor(zzli/blockchangdu) + 1,floor(j/blockkuandu) +1) = persentange2;

        end
    end
    out = M_persentage2;    
end



end