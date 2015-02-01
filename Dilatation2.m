function [objekt] = Dilatation(Maske,Objekt);

objekt = Objekt;


% Zunächst eine Umkehrung des Binärbildes um die nachfolgende
% Multiplikation mit der Maske durchführen zu können.

for i=1:size(Objekt,1)
    for j=1:size(Objekt,1)
        if objekt(i,j)==1;
           objekt(i,j)=0;
        else objekt(i,j)=1;
        end
    end
end

objekt01 = objekt;

% Die Schleifenindices werden so festgelegt, dass die Grenze des Bildes
% nicht überschritten wird.

for i=2:size(Objekt,1)-1
    for j=2:size(Objekt,1)-1
        
        Refpkt = objekt01(i-1:i+1,j-1:j+1);
        Selem = Maske .* Refpkt;
        
        if sum(sum(Selem)) == 0;
            objekt(i,j) = 0;
        else
            objekt(i,j) = 1;
        end
    end
end


% Hier wird die vorangegangene Umkehrung rückgängig gemacht.

for i=1:size(Objekt,1)
    for j=1:size(Objekt,1)
        if objekt(i,j)==0;
           objekt(i,j)=1;
        else objekt(i,j)=0;
        end
    end
end

end
