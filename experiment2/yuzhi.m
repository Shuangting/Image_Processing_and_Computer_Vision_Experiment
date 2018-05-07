%%%%%%%%%%%%%  ãĞÖµ·Ö¸î  %%%%%%%%%%%%%
function [bianyuan]=yuzhi(img,T,width,height)
for i=1:width
    for j=1:height
        if img(i,j)>T
            bianyuan(i,j)=0;
        else
            bianyuan(i,j)=255;
        end
    end
end
end