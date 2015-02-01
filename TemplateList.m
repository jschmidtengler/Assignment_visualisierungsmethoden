function [RotTemplates] = TemplateList(Template,Interpol,Schritte,angleS,angleF);
RotTemplates = {};
k=1;
for i=angleS:Schritte:angleF
    RotTemplates{k} = rotateImage(Template,i,Interpol);
    k=k+1;
end
end