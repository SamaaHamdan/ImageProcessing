function [binary_image] = rgbToBinary(rgb_image,threshold)
%rgbToBinary convert rgb to binary image
%   Controlled by the threshold

% Get image dimensions and number of matice
[h w l] = size(rgb_image);

% Construct binary_image matrix with rgb_image dimensions
binary_image = zeros(h, w);

if threshold < 0 || threshold > 255
    disp('Error: threshold is out of range');
    disp('Enter from 0 to 255');
else
    for i=1:h
        for j=1:w
            % Convert rgb image to grey one
            binary_image(i, j) = rgb_image(i, j, 1);
            
            % Convert the grey image to binary one
            if binary_image(i, j) > threshold
               binary_image(i, j) = 1;
            else
               binary_image(i, j) = 0;
            end
        end
    end
end
% Convert datatype to logical
binary_image = logical(binary_image);
end

