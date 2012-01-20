
% load training set, 27 classes
num_labels = 27
[X1, y1] = load_set("training/bs_bb", "*.png", 1);
[X2, y2] = load_set("training/bs_bk", "*.png", 2);
[X3, y3] = load_set("training/bs_blank", "*.png", 3);
[X4, y4] = load_set("training/bs_bn", "*.png", 4);
[X5, y5] = load_set("training/bs_bp", "*.png", 5);
[X6, y6] = load_set("training/bs_bq", "*.png", 6);
[X7, y7] = load_set("training/bs_br", "*.png", 7);
[X8, y8] = load_set("training/bs_wb", "*.png", 8);
[X9, y9] = load_set("training/bs_wk", "*.png", 9);
[X10, y10] = load_set("training/bs_wn", "*.png", 10);
[X11, y11] = load_set("training/bs_wp", "*.png", 11);
[X12, y12] = load_set("training/bs_wq", "*.png", 12);
[X13, y13] = load_set("training/bs_wr", "*.png", 13);
[X14, y14] = load_set("training/neg", "*.png", 14);
[X15, y15] = load_set("training/ws_bb", "*.png", 15);
[X16, y16] = load_set("training/ws_bk", "*.png", 16);
[X17, y17] = load_set("training/ws_blank", "*.png", 17);
[X18, y18] = load_set("training/ws_bn", "*.png", 18);
[X19, y19] = load_set("training/ws_bp", "*.png", 19);
[X20, y20] = load_set("training/ws_bq", "*.png", 20);
[X21, y21] = load_set("training/ws_br", "*.png", 21);
[X22, y22] = load_set("training/ws_wb", "*.png", 22);
[X23, y23] = load_set("training/ws_wk", "*.png", 23);
[X24, y24] = load_set("training/ws_wn", "*.png", 24);
[X25, y25] = load_set("training/ws_wp", "*.png", 25);
[X26, y26] = load_set("training/ws_wq", "*.png", 26);
[X27, y27] = load_set("training/ws_wr", "*.png", 27);


X = [X1; X2; X3; X4; X5; X6; X7; X8; X9; X10; X11; X12; X13; X14; X15; X16; X17; X18; X19; X20; X21; X22; X23; X24; X25; X26; X27];
y = [y1; y2; y3; y4; y5; y6; y7; y8; y9; y10; y11; y12; y13; y14; y15; y16; y17; y18; y19; y20; y21; y22; y23; y24; y25; y26; y27];

save chessData.mat X y;

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

lambda = 0.001

options = optimset('GradObj', 'on', 'MaxIter', 25);
for c = 1:num_labels,
	initial_theta = zeros(n + 1, 1);
	[theta] = ...
         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
                 initial_theta, options);
	all_theta(c,:) = theta;
end

save all_theta.mat all_theta;
%ppos = sigmoid(Xpos*theta);
%pneg = sigmoid(Xneg*theta);