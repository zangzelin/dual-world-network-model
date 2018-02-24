% 初始化画布
P = 255*ones(500,500,3);
% 进行染色
P(:,:,1) = 255-net1*255;
P(:,:,2) = 255-net2*255;
% 将有效的画布截取出来
PP = P(jiaoyoufanwei:500-jiaoyoufanwei,jiaoyoufanwei:500-jiaoyoufanwei,:);
% imshow(PP);
% hold off