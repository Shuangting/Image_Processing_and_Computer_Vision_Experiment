img=double(imread('./cave.jpg'));
figure;
subplot(1,3,1);
imshow(uint8(img));
title('original image')
% Gauss high pass filter
[M,N]=size(img);
D=zeros(M,N);
for i=1:M
    for j=1:N 
        D(i,j)=sqrt(((i-floor(M/2)-1)^2+(j-floor(N/2)-1)^2)); 
    end                
end 
c=0.1;   %sharpen parameter 
Do=1; %usually the variance(cut-off frequency of the filter) 
H=(0.12-0.1)*(1-exp(-c*(D.^2/(Do^2))))+0.1; %function 
J = fft2(log(img+0.01)); 	  %FFT, img+0.01 to confirm log function has right domain
J = fftshift(J);   %spectrum shift frequency to origin
J=J.*H;
out = ifftshift(J) ;	%return spectrum position
out = ifft2(out);	 %inverse Fourier transform
out=exp(abs(out)-0.01);
subplot(1,3,2);
imshow(out,[]);
title('Homomorphic figure')
subplot(1,3,3);
imshow(abs(J),[0, 1000]);
title('frequency domain')