img=imread('/Users/gonglaoshi/Desktop/ʵ��һ/lena.bmp'); %��ȡͼ��
A=zeros(1,256);
B=zeros(1,256);
zft=img;
[height,width,flag]=size(zft); %�õ�ͼ�����
%����ͼ�����ص㣬�õ�ÿ������ֵ��Ӧ�����ص�������������A
for i=1:height
    for j=1:width
        A(1,zft(i,j)+1)=A(1,zft(i,j)+1)+1;
    end
end
 
B(1,1)=A(1,1);
%�γ��ۼƵ�ֱ��ͼ,���ۼ����ص�ĸ����������B
for i=2:256
    B(1,i)=B(1,i-1)+A(1,i);
end
%������ұ�
for q=1:256
    T(1,q)=round(255*B(1,q)/(width*height));
end
%ͼ���ÿ�����ص㣬����ԭ���ĻҶ�ֵ�ҵ��µĶ�Ӧ�ĻҶ�ֵ
for j=1:width
    for i=1:height
        zft(i,j)=T(1,zft(i,j)+1);
    end
end
%�ֱ���ԭͼ��ԭͼͼ��ֱ��ͼ�����⻯֮���ͼ��;��⻯��ͼ��ֱ��ͼ
subplot(2,2,1);
imshow(img);
title('ԭͼ');
subplot(2,2,2);
imhist(img);
title('ԭͼͼ��ֱ��ͼ');
subplot(2,2,3);
imshow(zft);
title('���⻯֮���ͼ��');
subplot(2,2,4);
imhist(zft);
title('���⻯��ͼ��ֱ��ͼ');
