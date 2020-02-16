function [negativeimg] = negative(img)
%negative makes negative
%   Detailed explanation goes here

    img = img ./ 256;
    img = 1- img;
    negativeimg = img .* 256;
end

