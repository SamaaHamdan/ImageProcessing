function result = RGB2Binary(im, T)
    im = double(im);
    r = im(:, :, 1);
    g = im(:, :, 2);
    b = im(:, :, 3);
    gray = (r + g + b) / 3;
    
    [H, W] = size(gray);
    result = zeros(H, W);
    
    for i=1:H
        for j=1:W
            if gray(i, j) > T
                result(i, j) = 1;
            else
                result(i, j) = 0;
            end
        end
    end
    
    result = logical(result);
end

