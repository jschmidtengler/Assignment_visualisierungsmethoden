function [binaerbild] = Binarisierung2(Bild,Schwellwert);

Length = size(Bild,1);
Width = size(Bild,2);
binaerbild = zeros(Length,Width);


for i=1:1:Length
        for j=1:1:Width
            if Bild(i,j)<Schwellwert;
                binaerbild(i,j)=0;
            else
                binaerbild(i,j)=1;
            end
        end
end
    