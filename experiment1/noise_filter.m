img=imread('/Users/gonglaoshi/Desktop/ʵ��һ/lena.bmp'); %��ȡͼ��
gaussian_noise=imnoise(img,'gaussian',0.02); %��Ӹ�˹����
subplot(1,3,1); %��ͼ����ͬ
imshow(gaussian_noise); %��ʾͼƬ����ͬ
title('��˹����'); %��ӱ��⣬��ͬ
salt_and_pepper_noise=imnoise(img,'salt & pepper',0.02); %��ӽ�������
subplot(1,3,2); 
imshow(salt_and_pepper_noise); 
title('��������');
noise = im2uint8(randn(size(img)).*0.1); %�������������������ת����unit8��������
impulse_noise=img+noise;  %�����������
subplot(1,3,3); 
imshow(impulse_noise); 
title('��������');
im_output1=filter2(fspecial('average',3),salt_and_pepper_noise)/255;%��ֵ�˲�
figure; %�����´���
subplot(1,3,1);
imshow(img); 
title('ԭͼ');
subplot(1,3,2);
imshow(im_output1); 
title('��ֵ�˲�');
im_output2 = medfilt2(salt_and_pepper_noise, [3 3]); %��ֵ�˲�
subplot(1,3,3); 
imshow(im_output2); 
title('��ֵ�˲�');





