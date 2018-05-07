img=imread('/Users/gonglaoshi/Desktop/实验一/landscape.jpg'); %读取图像
A1=zeros(1,256);
A2=zeros(1,256);
A3=zeros(1,256);
B1=zeros(1,256);
B2=zeros(1,256);
B3=zeros(1,256);
zft=img;
[height,width,flag]=size(zft); %得到图像参数
%遍历图像像素点，得到每个像素值对应的像素点个数，存入矩阵A
for i=1:height
    for j=1:width
        A1(1,zft(i,j,1)+1)=A1(1,zft(i,j,1)+1)+1;
        A2(1,zft(i,j,2)+1)=A2(1,zft(i,j,2)+1)+1;
        A3(1,zft(i,j,3)+1)=A3(1,zft(i,j,3)+1)+1;
    end
end
 
B1(1,1)=A1(1,1);
B2(1,1)=A2(1,1);
B3(1,1)=A3(1,1);

%形成累计的直方图,将累计像素点的个数存入矩阵B
for i=2:256
    B1(1,i)=B1(1,i-1)+A1(1,i);
    B2(1,i)=B2(1,i-1)+A2(1,i);
    B3(1,i)=B3(1,i-1)+A3(1,i);
end
%构造查找表
for q=1:256
    T1(1,q)=round(255*B1(1,q)/(width*height));
    T2(1,q)=round(255*B2(1,q)/(width*height));
    T3(1,q)=round(255*B3(1,q)/(width*height));
end
%图像的每个像素点，根据原来的灰度值找到新的对应的灰度值
for j=1:width
    for i=1:height
        zft(i,j,1)=T1(1,zft(i,j,1)+1);
        zft(i,j,2)=T2(1,zft(i,j,2)+1);
        zft(i,j,3)=T3(1,zft(i,j,3)+1);
    end
end
%分别作原图和均衡化之后的图像
subplot(1,2,1);
imshow(img);
title('原图');
subplot(1,2,2);
imshow(zft);
title('均衡化之后的图像');
