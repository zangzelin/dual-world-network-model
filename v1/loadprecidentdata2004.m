function output = loadprecidentdata2004()
% 用于载入2004年总统竞选的数据
% 没有输入变量
output = [  
44	50;
47	47;
49	45;
48	44;
47	43;
48	43;
50	44;
48	46;
47	47;
47	45;
46	47;
44	48;
43	49;
45	48;
48	47;
46	49;
45	50;
46	47;
51	45;
50	45;
48	46;
48	46;
48	46;
48	46;
52	45;
52	45;
52	44;
52	44;
49	49;
48	49;
52	44;
51	46;
];

for i = 1:length(output)
    sum1 = output(i,1)+output(i,2);
    output(i,1) = output(i,1)/sum1;
    output(i,2) = output(i,2)/sum1;
end

% plot(output)

% hold on 

% plot(output[:,2])

end