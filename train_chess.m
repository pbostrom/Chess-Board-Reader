
% load training set, 6 classes
num_labels = 6
[X1, y1] = load_set("training/bs_black", "*.png", 1);
[X2, y2] = load_set("training/bs_blank", "*.png", 2);
[X3, y3] = load_set("training/bs_white", "*.png", 3);
[X4, y4] = load_set("training/ws_black", "*.png", 4);
[X5, y5] = load_set("training/ws_blank", "*.png", 5);
[X6, y6] = load_set("training/ws_white", "*.png", 6);

X = [X1; X2; X3; X4; X5; X6];
y = [y1; y2; y3; y4; y5; y6];

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

options = optimset('GradObj', 'on', 'MaxIter', 50);
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