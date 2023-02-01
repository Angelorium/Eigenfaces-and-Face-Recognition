clear, clc
image_path = 'faces_recognition/';
height = 112;
width = 92;

X = flatten(image_path,99, height, width);
[U_K, R, M] = reduce(X, 0.98);

%% flattening image
img_flattened = flatten_img('query_images/', 3, height, width);

%% reducing image
r = reduce_img(img_flattened, M, U_K);

%% recognize the image 
img = recognize_img(U_K, R, M, r, height, width);

%% plot the image found and the original image
subplot(1,2,1);
imshow(img, []);
xlabel('Image found');
subplot(1,2,2);
imshow(reshape(img_flattened, [height, width]));
xlabel('Original image');