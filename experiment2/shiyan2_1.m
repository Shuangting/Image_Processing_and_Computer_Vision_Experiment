% % % % % % % % % % % % % % % % % % % % % % % %
% ʵ��� ��ֵ���ָ�ʵ��
% author����˪��  
% 2018.4.24
% % % % % % % % % % % % % % % % % % % % % % % %
img=imread('./cells.bmp');
[height,width,flag]=size(img);
subplot(1,3,1);
imshow(img);
title('ԭͼ');
% ��ϵͳ�Դ�������ɶ�ֵ��ͼ��
level=graythresh(img); %�ô����ֵ������ȡ��ֵ
bw=im2bw(img,level);%������ֵ��ֵ��ͼ��
subplot(1,3,2);
imshow(bw);
title('ʹ��matlab����');
% �Լ���д������ɴ����ֵ������ֵ��ͼ��
imggray=rgb2gray(img);% ת���Ҷ�ͼ
A=zeros(1,256);
B=zeros(1,256);
C=zeros(1,256);
D=zeros(1,256);
aver1=zeros(1,256);
aver2=zeros(1,256);
aver=zeros(1,256);
sum=zeros(1,256);
% ��ͼ�����ص㣬�õ�ÿ������ֵ��Ӧ�����ص�������������A
for i=1:height
    for j=1:width
        A(1,imggray(i,j)+1)=A(1,imggray(i,j)+1)+1;
    end
end
% �õ�ÿ������ֵ��ͼ�е�Ƶ�ʣ��������B
for i=1:256
    B(1,i)=A(1,i)/(height*width);
end
% large��ʾ�������ʱ��Ӧ������ֵ������ֵ��fangcha��ʾ�������󷽲�
large=0;
fangcha=0;
C(1,1)=B(1,1);
for T=1:256
    for i=2:T
        C(1,i)=B(1,i)+C(1,i-1);
    end
%     �Ҷ�ֵ��1��T���ڸ���Ϊsum1
    sum1=C(1,T);
    for i=T+1:256
        D(1,i)=D(1,i-1)+B(1,i);
    end
%     �Ҷ�ֵ��T��1��256���ڸ���Ϊsum2
    sum2=D(1,256);
    for i=2:T
        aver1(1,i)=(i-1)*B(1,i)/sum1+aver1(1,i-1);
    end
%     �Ҷ�ֵ��1��T���ڵ�ƽ��ֵΪu1
    u1=aver1(1,T);
    for i=T+1:256
        aver2(1,i)=(i-1)*B(1,i)/sum2+aver2(1,i-1);
    end
%     �Ҷ�ֵ��T��1��256���ڵ�ƽ��ֵΪu2
    u2=aver2(1,256);
    fangcha1=sum1*sum2*(u1-u2)^2;
    if fangcha1>fangcha
        fangcha=fangcha1;
        large=T-1;
    end
end
% ������ֵ��ֵ��ͼ��
for i=1:height
    for j=1:width
        if imggray(i,j)>large
            imggray(i,j)=255;
        else
            imggray(i,j)=0;
        end
    end
end
% ��ʾͼ��
subplot(1,3,3);
imshow(imggray);
title('���б�д�����ֵ��ʵ�ֳ���');