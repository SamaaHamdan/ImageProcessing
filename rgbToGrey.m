function [grey_image] = rgbToGrey(rgb_image, option)

% Get image dimensions and number of matices
[h w l] = size(rgb_image);

% Construct grey_image matrix with rgb_image dimensions
grey_image = zeros(h, w);
% Convert datatype to double
grey_image = double(grey_image);

if option < 1 || option > 5
    disp('Error: option is out of range');
    disp('Enter from 1 to 5');
else
    for i=1:h
       for j=1:w
           % Use average method
          if option == 1
              grey_image(i, j) = (rgb_image(i, j, 1) + rgb_image(i, j, 2) + rgb_image(i, j, 3)) / 3;

          % Use percent multiplication method
          elseif option == 2
              grey_image(i, j) = (rgb_image(i, j, 1)*0.3 + rgb_image(i, j, 2)*0.3 + rgb_image(i, j, 3)*0.4);

          % Use red matrix method    
          elseif option == 3
              grey_image(i, j) = rgb_image(i,j,1);

          % Use green matrix method    
          elseif option == 4
              grey_image(i, j) = rgb_image(i,j,2);

          % Use blue matrix method    
          elseif option == 5
              grey_image(i, j) = rgb_image(i,j,3);
          end
       end
    end
end

% Convert datatype to uint8
grey_image = uint8(grey_image);

end

