clc;
img = im2double(imread('./grid.bmp'));
figure
subplot(2,3,1);
imshow(img);
title('original image')
subplot(2,3,4);
imshow(img);
title('original image')
[width,height] = size(img);
J = fft2(img); 	  %FFT
J = fftshift(J);   %spectrum shift frequency to origin
L=abs(J/256);
%%%%%%%%%%%%%Low pass filtering%%%%%%%%%%%
% For low frequency components, reserve frequency components when frequency
% is lower than a certain threshold.
J1 = J;
J1(width/2-5:width/2+5,height/2-5:height/2+5)=0;
J_1=J-J1;
% For high-frequency components, 
% when the intensity of a frequency is greater than the threshold, 
% attenuates the intensity to the threshold.
for i=1:width
    for j=1:height
        if abs(J1(i,j))>7e2
            J1(i,j)=7e2;
        end
    end
end
J_1=J_1+J1;  %add high-frequency and low-frequency components
filt = ifftshift(J_1) ;	%%return spectrum position
out = ifft2(filt);	 %inverse Fourier transform
subplot(2,3,2);
imshow(abs(out));
title('low-pass transform figure')
subplot(2,3,3);
imshow(abs(J_1/256));
title('frequency domain')

%%%%%%%%%High pass filtering%%%%%%%%%
J2=J;
J2(width/2-7:width/2+7,height/2-7:height/2+7)=0;
filt_h = ifftshift(J2) ;	%%return spectrum position
out2 = ifft2(filt_h);	 %inverse Fourier transform
subplot(2,3,5);
imshow(abs(out2));
title('high-pass transform figure')
subplot(2,3,6);
imshow(abs(J2/256));
title('frequency domain')