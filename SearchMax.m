function [Maxima] = SearchMax(Bild);

Length = size(Bild,1);
Width = size(Bild,2);
AusBild=Bild;
Maxima = [];

for i=1:5:Length-29
    for j=1:5:Width-29
        Ausschnitt = AusBild(i:i+29, j:j+29);
        if max(max(Ausschnitt))~=0 && sum(Ausschnitt(1,1:30),2)==0 && ...
                sum(Ausschnitt(30,1:30),2)==0 && sum(Ausschnitt(1:30,1),1)==0 ...
                && sum(Ausschnitt(1:30,30),1)==0;
            [x,y]=find(AusBild == max(Ausschnitt(:))); Maxima = [Maxima [x,y]]; AusBild(i:i+29, j:j+29)=0;
        end 
    end
end

end