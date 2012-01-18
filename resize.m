cd("img");
full_img = double(imread("resize_bn_bs.png"));
size(full_img)

%img2 = imresize(full_img, [30 30], 'box');
%img3 = imresize(full_img, [30 30], 'bicubic');
img1 = imresize(full_img, [30 30], 'bicubic', 2);

imwrite(img1, "bn_bs30_1.png");
%imwrite(img2, "bn_bs30_2.png");
%imwrite(img3, "bn_bs30_3.png");
cd("..");