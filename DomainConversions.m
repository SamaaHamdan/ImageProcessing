function [newImage] = DomainConversions(image, option)

%option1 -> spatial 2 frequancy
if option==1
    newImage=fft2(image);
    newImage=fftshift(newImage);
%frequancy 2 spatial
else
    newImage=fftshift(image);
    newImage=ifft2(newImage);
end
newImage=abs(newImage);    %deal with complix numbers
newImage=log(1+newImage);  %brightness
newImage=mat2gray(newImage);  %normalization
end
