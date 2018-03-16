function [ persentange1, persentange2] = returnpersantage(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, net1, net2, fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown)
    
    [net1, net2] = renjichuanbo2(changdu, kuandu,jiaoyoufanwei,frends, pengyoushu, net1, net2, fankang1, fankang2,zhixinfazhi,zhixindu,Adown,Bdown);
    newcbqk = jilushuju(net1,net2,changdu,kuandu);
    persentange1 = newcbqk(1)/(sum(newcbqk));
    persentange2 = 1 - persentange1;

end


