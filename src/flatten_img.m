function [img] = flatten_img(image_path, i, height, width)
% Returns img given in input image_path, i, height, width.
% The name of the image must be "img (i)" where i is the number of the image.
% The file extension of the image must be ".pgm".
%
% image_path is the path of the image 
% i is the number of the image
% height is the heigth of the image
% width is the width of the image
%
% img is the vector containing the flattened image
 
% image size
d = height*width;

% computing img
img = zeros(d, 1);

    filename = strcat(image_path, 'img (', num2str(i), ').pgm');
    image = imread(filename);
    image_double = im2double(image);
    img(:, 1) = reshape(image_double, [d, 1]);