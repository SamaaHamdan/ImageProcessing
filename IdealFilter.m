function [newImage] = IdealFilter(image,D0,option)

[h w l]=size(image);
filter=zeros(h, w, l);

for i=1:h
    for j=1:w
        dis=sqrt((i-(h/2)).^2+(j-(w/2)).^2);
        if dis<=D0
            filter(i,j)=1;
        end
    end
end

    %heighpass filter
    if option==2
        filter=1-filter;
    end

%     newImage=DomainConversions(image,1);
%     newImage=newImage.*filter;
%     newImage=DomainConversions(newImage,2);

    fourier=fft2(image);
    fourier=fftshift(fourier);
    reall=real(fourier);
    imagine=imag(fourier);
    reall=filter.*reall;
    imagine=filter.*imagine;
    newImage=reall(:,:)+i*imagine(:,:);
    newImage=fftshift(newImage);
    newImage=ifft2(newImage);
    newImage=mat2gray((abs(newImage)));

end
