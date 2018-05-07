%%%%%%%%%%%%%%  canny������ȡ��Ե  %%%%%%%%%%%%%%%%%%
function canny(width,height,img,Tmax,Tmin)
H=fspecial('gaussian',[3 3]);
img_gauss=imfilter(img,H,'replicate'); 
Ay=zeros(width,height);
o1=zeros(width,height);
o=zeros(width,height);
img_wider=zeros((height+2),(width+2));
% ��ԭͼ�߽�����һȦ����
for i=1:width
    for j=1:height
        img_wider(i+1,j+1)=img_gauss(i,j);
    end
end
% sobel������ֱ�����Ե
for i=2:width+1
    for j=2:height+1
        Ay(i-1,j-1)=(-1)*img_wider(i-1,j-1)+img_wider(i+1,j-1)+(-2)*img_wider(i-1,j)+2*img_wider(i+1,j)+(-1)*img_wider(i-1,j+1)+img_wider(i+1,j+1);
    end
end
% sobel������ˮƽ�����Ե
for i=2:width+1
    for j=2:height+1
        Ax(i-1,j-1)=img_wider(i-1,j-1)+2*img_wider(i,j-1)+img_wider(i+1,j-1)+(-1)*img_wider(i-1,j+1)+(-2)*img_wider(i,j+1)+(-1)*img_wider(i+1,j+1);
    end
end
% ƽ���Ϳ������ۺ�ˮƽ�ʹ�ֱ��Ե,���ݶȷ���theta
for i=1:width
    for j=1:height
        G1(i,j)=sqrt((Ax(i,j))^2+(Ay(i,j))^2);
        theta(i,j)=atand(Ax(i,j)/Ay(i,j));
%   2 1 0
%   3 X 3
%y  0 1 2

        if (theta(i,j)<67.5)&&(theta(i,j)>22.5)%sector�����ݶȽǶȻ�������
            sector(i,j)=0;
        elseif (theta(i,j)<22.5)&&(theta(i,j)>-22.5)
            sector(i,j)=3;    
        elseif (theta(i,j)<-22.5)&&(theta(i,j)>-67.5)
            sector(i,j)=2;    
        else
            sector(i,j)=1;    
        end

    end
end
G=uint8(G1);
% ����ֵ����

for i=2:width-1
    for j=2:height-1
%         ������Ϻ������ݶ�
        if sector(i,j)==0
            if((G(i,j)>G(i+1,j-1))&&(G(i,j)>G(i-1,j+1)))
                o(i,j)=G(i,j);
            else
                o(i,j)=0;
            end
%         �����ֱ����
        elseif sector(i,j)==1
            if((G(i,j)>G(i,j-1))&&(G(i,j)>G(i,j+1)))
                o(i,j)=G(i,j);
            else
                o(i,j)=0;
            end
%         ������Ϻ������ݶ�
        elseif sector(i,j)==2
            if((G(i,j)>G(i-1,j-1))&&(G(i,j)>G(i+1,j+1)))
                o(i,j)=G(i,j);
            else
                o(i,j)=0;
            end
%         ���ˮƽ����
        elseif sector(i,j)==3
            if((G(i,j)>G(i+1,j))&&(G(i,j)>G(i-1,j)))
                o(i,j)=G(i,j);
            else
                o(i,j)=0;
            end
        end
    end
end

% ˫��ֵ���
for j=1:height
    o1(1,j)=G(1,j);
    o1(width,j)=G(width,j);
end

for i=1:width
    o1(i,1)=G(i,1);
    o1(i,width)=G(i,width);
end

for i=1:width
    for j=1:height
        if o(i,j)>Tmax
            o1(i,j)=0;
        elseif o(i,j)<Tmin
            o1(i,j)=255;
        else
            o1(i,j)=0;
        end
    end
end

figure;
imshow(o1);
end