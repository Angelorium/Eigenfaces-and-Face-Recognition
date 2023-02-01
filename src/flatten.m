function [X] = flatten(image_path, n, height, width)
% Returns X given in input image_path, n, height, width.
% The name of the image must be "img (i)" where i is the number of the image.
% The file extension of the image must be ".pgm".
%
% image_path is the path of the images 
% n is the number of the images
% height is the heigth of each image
% width is the width of each image
%
% X is the matrix containing the flattened images
 
% dimension of each image
d = height*width;

% computing X
X = zeros(d,n);

for i=1:n
    filename = strcat(image_path, 'img (', num2str(i), ').pgm');
    image = imread(filename);
    image_double = im2double(image);
    X(:, i) = reshape(image_double, [d, 1]);

end