function [Korrel] = Korrelation2(image1,image2);


m = size(image1,1)+size(image2,1);
n = size(image1,2)+size(image2,2);
Korrel = abs(fftshift(ifft2(fftshift(fft2(image1,m,n)).*conj(fftshift(fft2(image2,m,n))))));

end