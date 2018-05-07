img=imread('/Users/gonglaoshi/Desktop/实验一/lena.bmp'); %读取图像
A=zeros(1,256);
B=zeros(1,256);
zft=img;
[height,width,flag]=size(zft); %得到图像参数
%遍历图像像素点，得到每个像素值对应的像素点个数，存入矩阵A
for i=1:height
    for j=1:width
        A(1,zft(i,j)+1)=A(1,zft(i,j)+1)+1;
    end
end
 
B(1,1)=A(1,1);
%形成累计的直方图,将累计像素点的个数存入矩阵B
for i=2:256
    B(1,i)=B(1,i-1)+A(1,i);
end
%构造查找表
for q=1:256
    T(1,q)=round(255*B(1,q)/(width*height));
end
%图像的每个像素点，根据原来的灰度值找到新的对应的灰度值
for j=1:width
    for i=1:height
        zft(i,j)=T(1,zft(i,j)+1);
    end
end
%分别作原图，原图图像直方图，均衡化之后的图像和均衡化后图像直方图
subplot(2,2,1);
imshow(img);
title('原图');
subplot(2,2,2);
imhist(img);
title('原图图像直方图');
subplot(2,2,3);
imshow(zft);
title('均衡化之后的图像');
subplot(2,2,4);
imhist(zft);
title('均衡化后图像直方图');
