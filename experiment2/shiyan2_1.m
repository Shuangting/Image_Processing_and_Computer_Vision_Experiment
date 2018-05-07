% % % % % % % % % % % % % % % % % % % % % % % %
% 实验二 阈值化分割实验
% author：刘霜婷  
% 2018.4.24
% % % % % % % % % % % % % % % % % % % % % % % %
img=imread('./cells.bmp');
[height,width,flag]=size(img);
subplot(1,3,1);
imshow(img);
title('原图');
% 用系统自带函数完成二值化图像
level=graythresh(img); %用大津阈值方法获取阈值
bw=im2bw(img,level);%根据阈值二值化图像
subplot(1,3,2);
imshow(bw);
title('使用matlab函数');
% 自己编写程序完成大津阈值方法二值化图像
imggray=rgb2gray(img);% 转化灰度图
A=zeros(1,256);
B=zeros(1,256);
C=zeros(1,256);
D=zeros(1,256);
aver1=zeros(1,256);
aver2=zeros(1,256);
aver=zeros(1,256);
sum=zeros(1,256);
% 历图像像素点，得到每个像素值对应的像素点个数，存入矩阵A
for i=1:height
    for j=1:width
        A(1,imggray(i,j)+1)=A(1,imggray(i,j)+1)+1;
    end
end
% 得到每个像素值在图中的频率，存入矩阵B
for i=1:256
    B(1,i)=A(1,i)/(height*width);
end
% large表示方差最大时对应的像素值，即阈值。fangcha表示两组间最大方差
large=0;
fangcha=0;
C(1,1)=B(1,1);
for T=1:256
    for i=2:T
        C(1,i)=B(1,i)+C(1,i-1);
    end
%     灰度值在1～T级内概率为sum1
    sum1=C(1,T);
    for i=T+1:256
        D(1,i)=D(1,i-1)+B(1,i);
    end
%     灰度值在T＋1～256级内概率为sum2
    sum2=D(1,256);
    for i=2:T
        aver1(1,i)=(i-1)*B(1,i)/sum1+aver1(1,i-1);
    end
%     灰度值在1～T级内的平均值为u1
    u1=aver1(1,T);
    for i=T+1:256
        aver2(1,i)=(i-1)*B(1,i)/sum2+aver2(1,i-1);
    end
%     灰度值在T＋1～256级内的平均值为u2
    u2=aver2(1,256);
    fangcha1=sum1*sum2*(u1-u2)^2;
    if fangcha1>fangcha
        fangcha=fangcha1;
        large=T-1;
    end
end
% 根据阈值二值化图像
for i=1:height
    for j=1:width
        if imggray(i,j)>large
            imggray(i,j)=255;
        else
            imggray(i,j)=0;
        end
    end
end
% 显示图像
subplot(1,3,3);
imshow(imggray);
title('自行编写大津阈值的实现程序');