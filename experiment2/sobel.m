%%%%%%%% sobel算子提取边缘  %%%%%%%%%%%%
function sobel(height,width,img_wider)
A=zeros(width,height);
B=zeros(width,height);
C=zeros(width,height);
D=zeros(width,height);

% sobel算子求垂直方向边缘
for i=2:width+1
    for j=2:height+1
        A(i-1,j-1)=(-1)*img_wider(i-1,j-1)+img_wider(i+1,j-1)+(-2)*img_wider(i-1,j)+2*img_wider(i+1,j)+(-1)*img_wider(i-1,j+1)+img_wider(i+1,j+1);
    end
end
% sobel算子求水平方向边缘
for i=2:width+1
    for j=2:height+1
        B(i-1,j-1)=img_wider(i-1,j-1)+2*img_wider(i,j-1)+img_wider(i+1,j-1)+(-1)*img_wider(i-1,j+1)+(-2)*img_wider(i,j+1)+(-1)*img_wider(i+1,j+1);
    end
end
% 分别用绝对值相加和平方和开根号综合水平和垂直边缘
for i=1:width
    for j=1:height
        C(i,j)=abs(A(i,j))+abs(B(i,j));
        D(i,j)=sqrt((A(i,j))^2+(B(i,j))^2);
    end
end
% 转换数据类型，画图
D1=uint8(C);
D2=uint8(D);
figure;
subplot(1,2,1);
imshow(D1);
title('|x|+|y|');
subplot(1,2,2);
imshow(D2);
title('√(x^2+y^2)');
% 根据不同阈值划分图像
figure;
bianyuan1=yuzhi(D1,250,width,height);
subplot(1,3,1);
imshow(bianyuan1);
title('阈值为250');
bianyuan2=yuzhi(D1,200,width,height);
subplot(1,3,2);
imshow(bianyuan2);
title('阈值为200');
bianyuan3=yuzhi(D1,150,width,height);
subplot(1,3,3);
imshow(bianyuan3);
title('阈值为150');
end