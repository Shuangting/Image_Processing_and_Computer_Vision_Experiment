img=imread('/Users/gonglaoshi/Desktop/ʵ��һ/landscape.jpg'); %��ȡͼ��
A1=zeros(1,256);
A2=zeros(1,256);
A3=zeros(1,256);
B1=zeros(1,256);
B2=zeros(1,256);
B3=zeros(1,256);
zft=img;
[height,width,flag]=size(zft); %�õ�ͼ�����
%����ͼ�����ص㣬�õ�ÿ������ֵ��Ӧ�����ص�������������A
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

%�γ��ۼƵ�ֱ��ͼ,���ۼ����ص�ĸ����������B
for i=2:256
    B1(1,i)=B1(1,i-1)+A1(1,i);
    B2(1,i)=B2(1,i-1)+A2(1,i);
    B3(1,i)=B3(1,i-1)+A3(1,i);
end
%������ұ�
for q=1:256
    T1(1,q)=round(255*B1(1,q)/(width*height));
    T2(1,q)=round(255*B2(1,q)/(width*height));
    T3(1,q)=round(255*B3(1,q)/(width*height));
end
%ͼ���ÿ�����ص㣬����ԭ���ĻҶ�ֵ�ҵ��µĶ�Ӧ�ĻҶ�ֵ
for j=1:width
    for i=1:height
        zft(i,j,1)=T1(1,zft(i,j,1)+1);
        zft(i,j,2)=T2(1,zft(i,j,2)+1);
        zft(i,j,3)=T3(1,zft(i,j,3)+1);
    end
end
%�ֱ���ԭͼ�;��⻯֮���ͼ��
subplot(1,2,1);
imshow(img);
title('ԭͼ');
subplot(1,2,2);
imshow(zft);
title('���⻯֮���ͼ��');
