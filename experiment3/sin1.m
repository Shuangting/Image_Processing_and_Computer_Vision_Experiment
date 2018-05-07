img = im2double(imread('./lena.bmp'));
J = fftshift(fft2(img));
J(128 : 129, 120) = 20 * J(128 : 129, 120);
J(128 : 129, 137) = 20 * J(128 : 129, 137);
subplot(1, 3, 1)
imshow(img)
title('original image')
subplot(1, 3, 2)
out = ifft2(ifftshift(J));
imshow(abs(out))
title('adding sin waves')
subplot(1, 3, 3)
T = abs(J/256);
imshow(T)
title('frequency domain')
