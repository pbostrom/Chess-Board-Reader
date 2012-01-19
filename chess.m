
% load training data
load('ws_theta.mat');
addpath(pwd);
% load an image and find the first square
cd("img");
full_img = double(imread("full_rev.png"));
scan_size = 48;
test_size = 30;
cd("..");
colormap(gray(256));
cd("dump");
for ri=1:(size(full_img,1) - scan_size),
	for ci=1:(size(full_img,2) - scan_size),
		img = full_img(ri:ri+scan_size-1,ci:ci+scan_size-1);
		img = imresize(img, [test_size test_size]);
		flatimg = [1 img(:)'];
		prob = sigmoid(flatimg*theta);
		%one vs all prediction
		%p1 = sigmoid(X*all_theta');
		%[val, p] =  max(p1, [], 2);
		if  prob > 0.5,
			fname = sprintf("d%i%i.png", ri, ci);
			%imwrite(img, fname);
			imagesc(img);
			drawnow;
			fprintf('Displaying square. Probability: %f\n', prob);
			pause;
		end
	end
end
cd("..");