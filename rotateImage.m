function imgRot = rotateImage(image, angle, interpolate)
    s1 = size(image,1);
    s2 = size(image,2);
    
    %inverse rotation transformation!
    rotMat = [cosd(angle) sind(angle); -sind(angle) cosd(angle)];
    imgRot = zeros(s1,s2);

    if strcmp(interpolate, 'linear')
        for x = 1:s1
            for y = 1:s2
                p = rotMat * [x - s1/2; y - s2/2];
                imgRot(x,y) = GetPixelLinear(image, p(1) + s1/2, p(2) + s2/2);
            end;
        end;
    else   
        for x = 1:s1
            for y = 1:s2
                p = rotMat * [x - s1/2; y - s2/2];
                imgRot(x,y) = GetPixelNearest(image, p(1) + s1/2, p(2) + s2/2);
            end;
        end;
    end;
end