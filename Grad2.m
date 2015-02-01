function [Hvarxy2] = Grad2(Bild);

Length = size(Bild,1);
Width = size(Bild,2);

Ax = [0 0 0; 1 0 -1; 0 0 0];
Ay = [0 1 0; 0 0 0; 0 -1 0];
Axy = Ax + Ay;


Hvarxy=zeros(Length,Width);

for i=2:1:Length-1
    for j=2:1:Width-1
       A = Bild(i-1:i+1,j-1:j+1);
        gradx = Ax .* A;
        grady = Ay .* A;
        xsum = sum(sum(gradx));
        ysum = sum(sum(grady));
        Hvarxy(i,j) = sqrt(xsum^2 + ysum^2);
    end
end

Hvarxy2=zeros(Length,Width);

for i=2:1:Length-1
    for j=2:1:Width-1
       A = Hvarxy(i-1:i+1,j-1:j+1);
        gradx = Ax .* A;
        grady = Ay .* A;
        xsum = sum(sum(gradx));
        ysum = sum(sum(grady));
        Hvarxy2(i,j) = sqrt(xsum^2 + ysum^2);
    end
end

end