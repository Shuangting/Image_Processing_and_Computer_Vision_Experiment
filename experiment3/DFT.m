clc;
img1=imread('./rect.bmp');
J = fft2(img1); 	  %FFT
J = fftshift(J);   %spectrum shift frequency to origin
L=abs(J/256);
subplot(2,3,1);
imshow(img1);
title('original image');
subplot(2,3,4);
imshow(uint8(L));
title('original image in frequency domain');

img2=imread('./rect-45.bmp');
J2 = fft2(img2); 	  %FFT
J2 = fftshift(J2);   %spectrum shift frequency to origin
L2=abs(J2/256);
subplot(2,3,2);
imshow(img2);
title('45-degree image');
subplot(2,3,5);
imshow(uint8(L2));
title('45 degree image in frequency domain');

img3=imread('./rect-move.bmp');
J3 = fft2(img3);	  %FFT
J3 = fftshift(J3);   %spectrum shift frequency to origin
L3=abs(J3/256);
subplot(2,3,3);
imshow(img3);
title('moved image');
subplot(2,3,6);
imshow(uint8(L3));
title('moved image in frequency domain');