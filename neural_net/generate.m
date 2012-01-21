% Generate training examples

full_img = double(imread("full.png"));
scan_size = 48;
test_size = 30;

% R1: 6 r2: 54 r3: 102 r4: 150 r5: 198 r6: 246 r7:294 r8: 342
cd("dump");
%for ri=1:(size(full_img,1) - scan_size),
for ri=293:295,
	for ci=1:(size(full_img,2) - scan_size),
		img = full_img(ri:ri+scan_size-1,ci:ci+scan_size-1);
		img = imresize(img, [test_size test_size]);
		
		fname = sprintf("d%i_%i.png", ri, ci);
		imwrite(uint8(img), fname);
	end
end
cd("..");