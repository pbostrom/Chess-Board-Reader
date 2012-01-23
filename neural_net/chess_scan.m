% load training data
load('nnTheta.mat');
global Th1 = Theta1;
global Th2 = Theta2;
global full_img = double(imread("test2.png"));
global test_size = uint16(30);
addpath(pwd);

function test_sq(ri, ci, sq_size)
    global full_img;
    global Th1;
    global Th2;
    global test_size;
    img = full_img(ri:ri+sq_size-1,ci:ci+sq_size-1);
    img = imresize(img, [test_size test_size]);
    flatimg = [1 img(:)'];
    %prob = sigmoid(flatimg*all_theta');
    h1 = sigmoid(flatimg * Th1');
    h2 = sigmoid([1 h1] * Th2');
    [val, p] =  max(h2, [], 2);
    %return;
    %one vs all prediction
    %p1 = sigmoid(X*all_theta');
    %
    %if  (p == 3 || p == 4) && val > 0.7,
    if val > 0.5 && p != 14,
        fname = sprintf("d%i_%i.png", ri, ci);
        %imwrite(uint8(img), fname);
        imagesc(img);
        drawnow;
        printf('Displaying square at r%i c%i. Probability: %f Index: %f\n', ri, ci, val, p);
        %h2
        toc;
        pause;
    endif
endfunction

%full_img = double(imread("full_rev.png"));
%full_img = double(imread("chris_ex1.png"));

img_size = uint16(size(full_img));
max_sq_sz = max(img_size)/8;
cntr = img_size./2;
sq_size = max_sq_sz;

colormap(gray);
%cd("dump");

% start in center
% while area scanned is < sq_sz * 2
% step right, step up, step++, step left, step down, step ++
sq_size = 50; %debug
tic;
while sq_size >= test_size
    area_scanned = 1;
    ri=cntr(1);
    ci=cntr(2);
    step_sz = 1;
    while area_scanned < (sq_size ^ 2)
        for i=0:step_sz % step right
            test_sq(ri, ci+i, sq_size);
        endfor
        ci = ci + step_sz; 
        area_scanned += step_sz;
        
        for i=(-step_sz):0
            test_sq(ri+i, ci, sq_size);
        endfor
        ri = ri - step_sz; % step up
        area_scanned += step_sz;
        step_sz++;

        for i = (-step_sz):0
            test_sq(ri, ci+i, sq_size);
        endfor
        ci = ci - step_sz; % step left
        area_scanned += step_sz;

        for i=0:step_sz
            test_sq(ri+i, ci, sq_size);
        endfor
        ri = ri + step_sz; % step down
        area_scanned += step_sz;
        step_sz++;
    endwhile
    sq_size--;
    printf('Stepping down square size: %i\n', sq_size);
endwhile

% r1:6 r2:54 r3:102 r4:150 r5:198 r6:246 r7:294 r8:342

%{
for ri=cntr(1):img_size(1) - scan_size,
	for ci=cntr(2):img_size(2) - scan_size,
        test_sq(ri, ci);
	endfor
endfor
%}
%cd("..");

