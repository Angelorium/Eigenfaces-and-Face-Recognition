clear, clc
image_path = 'faces/';
height = 112;
width = 92;

X = flatten(image_path, 400, height, width);
[U_K, R, M] = reduce(X, 0.95);

%% show mean face
img = reshape(M, height, width);
imshow(img, []);

%% recovering image 
recovered_image = recover_image(U_K, R, M, 1, height, width);
imshow(recovered_image, []);
original_image = reshape(X(:, 1), height, width);
% imshow(original_image);
 

%% show first 9 eigenfaces
 for i=1:9
     subplot(3,3,i) 
     imshow(reshape(U_K(:, i), height, width), [])
 end

%% show the number of eigenfaces used as captured information varies
eigenfaces_used(X);

%% show used spaces as captured information varies
space_used(X);