str ='3-19';
mkdir(str)
for i = 1:100
    zzl = out{1,i};
    zzl = zzl(1:length(zzl)-1,1:);
    zzl = (zzl-min(min(zzl)))/(max(max(zzl))-min(min(zzl)));
    
   
    imshow( zzl );
    imwrite(zzl , [str,'\zzl',num2str(i),'.png']);
end