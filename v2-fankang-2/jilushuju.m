function newcbqk = jilushuju(net1,net2,changdu,kuandu)

    chuanboqingkuang1 = 0;
    chuanboqingkuang2= 0;

    for i = 1:changdu
        for j = 1:kuandu
            if net1(i,j) == 1
            chuanboqingkuang1 = chuanboqingkuang1+1;    
            end
            if net2(i,j) == 1
            chuanboqingkuang2 = chuanboqingkuang2+1;    
            end
        end
    end

    newcbqk1 = chuanboqingkuang1/changdu/kuandu;
    newcbqk2 = chuanboqingkuang2/changdu/kuandu;
    newcbqk = [newcbqk1,newcbqk2];
end