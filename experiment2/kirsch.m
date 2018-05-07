%%%%%%%%%%%  kirsch算子提取边缘  %%%%%%%
function kirsch(height,width,img)
A=zeros(width,height);
o1=zeros(width,height);
o2=zeros(width,height);
o3=zeros(width,height);
o4=zeros(width,height);
o5=zeros(width,height);
o6=zeros(width,height);
o7=zeros(width,height);
o8=zeros(width,height);
Max=zeros(width,height);
% 调用函数，分别对8个mask进行模板扫描
o1=img_mask(3,3,3,3,-5,-5,-5,3,0,width,height,img);
o2=img_mask(3,3,3,3,3,-5,-5,-5,0,width,height,img);
o3=img_mask(-5,3,3,3,3,3,-5,-5,0,width,height,img);
o4=img_mask(-5,-5,3,3,3,3,3,-5,0,width,height,img);
o5=img_mask(-5,-5,-5,3,3,3,3,3,0,width,height,img);
o6=img_mask(3,-5,-5,-5,3,3,3,3,0,width,height,img);
o7=img_mask(3,3,-5,-5,-5,3,3,3,0,width,height,img);
o8=img_mask(3,3,3,-5,-5,-5,3,3,0,width,height,img);
% 运算中取最大值作为图像的边缘输出
for i=1:width
    for j=1:height
        if(Max(i,j)<o1(i,j))
            Max(i,j)=o1(i,j);
        else
            if(Max(i,j)<o2(i,j))
                 Max(i,j)=o2(i,j);
            else
                if(Max(i,j)<o3(i,j))
                    Max(i,j)=o3(i,j);
                else
                    if(Max(i,j)<o4(i,j))
                        Max(i,j)=o4(i,j);
                    else
                        if(Max(i,j)<o5(i,j))
                            Max(i,j)=o5(i,j);
                        else
                            if(Max(i,j)<o6(i,j))
                                Max(i,j)=o6(i,j);
                            else
                                if(Max(i,j)<o7(i,j))
                                    Max(i,j)=o7(i,j);
                                else
                                    if(Max(i,j)<o8(i,j))
                                        Max(i,j)=o8(i,j);
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
% 根据不同阈值划分图像
Max1=uint8(Max);
figure;
bianyuan1=yuzhi(Max1,250,width,height);
subplot(1,3,1);
imshow(bianyuan1);
title('阈值为250');
bianyuan2=yuzhi(Max1,200,width,height);
subplot(1,3,2);
imshow(bianyuan2);
title('阈值为200');
bianyuan3=yuzhi(Max1,150,width,height);
subplot(1,3,3);
imshow(bianyuan3);
title('阈值为150');
end

