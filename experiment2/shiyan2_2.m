% % % % % % % % % % % % % % % % % % % % % % % %
% % ʵ���-sobel������ȡ��Ե
% author����˪��  
% 2018.4.24
% % % % % % % % % % % % % % % % % % % % % % % %
img_org=imread('./lena.bmp');
[height,width,flag]=size(img_org);

img_wider=zeros((height+2),(width+2));
img = medfilt2(img_org, [3 3]); %��ֵ�˲�
% ��ԭͼ�߽�����һȦ����
for i=1:width
    for j=1:height
        img_wider(i+1,j+1)=img(i,j);
    end
end
% ���ú�������canny������ȡ��Ե
canny(width,height,img,250,80);
