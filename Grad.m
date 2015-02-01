function [Hvarxy] = Grad(Bild);

Length = size(Bild,1);
Width = size(Bild,2);

Ax = [0 0 0; 1 0 -1; 0 0 0];
Ay = [0 1 0; 0 0 0; 0 -1 0];
Axy = Ax + Ay;


Hvarxy=zeros(Length,Width);

for i=2:1:Length-1
    for j=2:1:Width-1
       A = Bild(i-1:i+1,j-1:j+1);
        grad = Axy .* A;
        Hvarxy(i,j) = sum(sum(grad));
    end
end

end