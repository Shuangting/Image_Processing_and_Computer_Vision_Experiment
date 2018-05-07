img=imread('/Users/gonglaoshi/Desktop/实验一/lena.bmp'); %读取图像
gaussian_noise=imnoise(img,'gaussian',0.02); %添加高斯噪声
subplot(1,3,1); %绘图，下同
imshow(gaussian_noise); %显示图片，下同
title('高斯噪声'); %添加标题，下同
salt_and_pepper_noise=imnoise(img,'salt & pepper',0.02); %添加椒盐噪声
subplot(1,3,2); 
imshow(salt_and_pepper_noise); 
title('椒盐噪声');
noise = im2uint8(randn(size(img)).*0.1); %生成随机噪声，并将其转化成unit8数据类型
impulse_noise=img+noise;  %添加脉冲噪声
subplot(1,3,3); 
imshow(impulse_noise); 
title('脉冲噪声');
im_output1=filter2(fspecial('average',3),salt_and_pepper_noise)/255;%均值滤波
figure; %开辟新窗口
subplot(1,3,1);
imshow(img); 
title('原图');
subplot(1,3,2);
imshow(im_output1); 
title('均值滤波');
im_output2 = medfilt2(salt_and_pepper_noise, [3 3]); %中值滤波
subplot(1,3,3); 
imshow(im_output2); 
title('中值滤波');





