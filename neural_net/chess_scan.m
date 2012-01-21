% load training data
load('nnTheta.mat');
addpath(pwd);

full_img = double(imread("full_rev.png"));
scan_size = 48;
test_size = 30;

colormap(gray);
cd("dump");

% r1:6 r2:54 r3:102 r4:150 r5:198 r6:246 r7:294 r8:342
for ri=101:(size(full_img,1) - scan_size),
	for ci=1:(size(full_img,2) - scan_size),
		img = full_img(ri:ri+scan_size-1,ci:ci+scan_size-1);
		img = imresize(img, [test_size test_size]);
		flatimg = [1 img(:)'];
		%prob = sigmoid(flatimg*all_theta');
		h1 = sigmoid(flatimg * Theta1');
		h2 = sigmoid([1 h1] * Theta2');
		[val, p] =  max(h2, [], 2);
		%return;
		%one vs all prediction
		%p1 = sigmoid(X*all_theta');
		%
		if  (p == 3 || p == 4) %&& val > 0.7,
			fname = sprintf("d%i_%i.png", ri, ci);
			imwrite(uint8(img), fname);
			imagesc(img);
			drawnow;
			fprintf('Displaying square. Probability: %f Index: %f\n', val, p);
			h2
			pause;
		end
	end
end
cd("..");