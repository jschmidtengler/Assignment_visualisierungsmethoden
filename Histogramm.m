function [Hist] = Histogramm(Image);

%make sure the range is in 0..255
Image(Image < 0) = 0;
Image(Image > 255) = 255;
    
Length = size(Image,1);
Width = size(Image,2);
Hist = zeros(Length,Width);

for i=1:1:Length
    for j=1:1:Width
           k = Image(i,j);
           Hist(k+1,1)= Hist(k+1,1)+1;
    end
end

bar(1:256,Hist(1:256));
end