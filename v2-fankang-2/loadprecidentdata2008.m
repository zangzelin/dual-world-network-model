function output = loadprecidentdata2008()
% 用于载入2008年总统竞选的数据
% 没有输入变量

output = [  46	44; 
            45	46;
            44	47;
            43	44;
            46	43;
            45.5	44;
            45	45;
            44.5	46;
            42	48;
            44	43;
            47	47;
            44	44;
            48	41;
            46	42;
            45	45;
            42	42;
            48	42;
            45	44;
            49	40;
            44	44;
            48	42;
            45	45;
            50	42;
            49	45;
            44	49;
            47	46;
            50	43;
            46	41;
            52	43;
            49	42;
            52	40;
            53	42;
            ];
for i = 1:length(output)
    sum1 = output(i,1)+output(i,2);
    output(i,1) = output(i,1)/sum1;
    output(i,2) = output(i,2)/sum1;
end
end