function [Anzahl] = counterAugen(augenzahlfile,drehungen,binaerbild,grenze);

output=zeros(800,1200);
for w=1:1:drehungen
    korr=Korrelation(augenzahlfile{w},binaerbild);
    output=korr;
end

Anzahl{1}=Counter2(output./(max(max(output))),grenze);
output=flipdim(flipdim(output ,1),2);
Anzahl{2}=output;
end