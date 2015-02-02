function [Korrel] = Korrelation(image1,image2);
Korrel=fftshift(abs((ifft2(fftshift(fft2(image1)).*conj(fftshift(fft2(image2)))))));
end