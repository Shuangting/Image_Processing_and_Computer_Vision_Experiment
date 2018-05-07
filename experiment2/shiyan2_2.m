% % % % % % % % % % % % % % % % % % % % % % % %
% % 实验二-sobel算子提取边缘
% author：刘霜婷  
% 2018.4.24
% % % % % % % % % % % % % % % % % % % % % % % %
img_org=imread('./lena.bmp');
[height,width,flag]=size(img_org);

img_wider=zeros((height+2),(width+2));
img = medfilt2(img_org, [3 3]); %中值滤波
% 对原图边界扩充一圈补零
for i=1:width
    for j=1:height
        img_wider(i+1,j+1)=img(i,j);
    end
end
% 调用函数，用canny算子提取边缘
canny(width,height,img,250,80);
