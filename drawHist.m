function [histo] = drawHist(image)
%by Robert Ayman
%drawHist draw the histogram
%   Detailed explanation goes here

% Get image dimensions and number of matice
[h w l] = size(image);

if l == 3
    % Construct grey_image matrix with rgb_image dimensions
    grey_image = zeros(h, w);
    % Convert datatype to double
    grey_image = double(grey_image);
    for i=1:h
        for j=1:w
            grey_image(i, j) = (image(i, j, 1) + image(i, j, 2) + image(i, j, 3)) / 3;
        end
    end
    % Convert datatype to uint8
    grey_image = uint8(grey_image);
    histo = histogram(grey_image);
else
    histo = histogram(image);
end

end
