function [newImage] = correlationFilter(image,mask,option)

[h w]=size(image);
masksize=length(mask);
padsize = (masksize-1)/2;



%zero padding
if option==1
    newImage=zeros(h, w);
    image=padarray(image, [padsize padsize]);
    for i=1:h
        for j=1:w
        subimg = image(i:i+2*padsize, j:j+2*padsize);
        newImage(i,j) = sum(sum(subimg .* mask));
        %clipping values out of range
        if newImage(i,j) < 0
            newImage(i,j)=0;
        elseif newImage(i,j)>255
            newImage(i,j)=255;
        end
        end
    end

%row duplication
elseif option==2
    newImage=zeros(h, w);
    image=padarray(image, [padsize padsize], 'symmetric');
    for i=1:h
        for j=1:w
        subimg = image(i:i+2*padsize, j:j+2*padsize);
        newImage(i,j) = sum(sum(subimg .* mask));
        %clipping values out of range
        if newImage(i,j) < 0
            newImage(i,j)=0;
        elseif newImage(i,j)>255
            newImage(i,j)=255;
        end
        end
    end

%ignore boarder
else
    newImage=zeros(h-2*padsize, w-2*padsize);
    for i=1: h-2*padsize
        for j=1: w-2*padsize
        subimg = image(i:i+2*padsize, j:j+2*padsize);
        newImage(i,j) = sum(sum(subimg .* mask));
        %clipping values out of range
        if newImage(i,j) < 0
            newImage(i,j)=0;
        elseif newImage(i,j)>255
            newImage(i,j)=255;
        end
        end
    end
end

newImage = uint8(newImage);

end
