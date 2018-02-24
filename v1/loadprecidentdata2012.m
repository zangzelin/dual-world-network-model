function output = loadprecidentdata2012()
% 用于载入2012年总统竞选的数据
% 没有输入变量

output = [  
45	47;
49	43;
46	46;
44	48;
44	50;
47	46;
45	46;
46	45;
47	45;
47	43;
48	44;
48	44;
48	44;
47	45;
46	46;
46	45;
47	45;
45	47;
47	46;
48	46;
49	45;
50	43;
50	44;
50	44;
50	45;
46	49;
48	48;
48	47;
49	46;
49	45;
49	46;
49	45;
     ];

for i = 1:length(output)
    sum1 = output(i,1)+output(i,2);
    output(i,1) = output(i,1)/sum1;
    output(i,2) = output(i,2)/sum1;
end

end