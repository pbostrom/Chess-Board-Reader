
% load training set
[Xpos, Xneg, ypos, yneg] = load_set("training/ws", "*.png");

Xpos = [ones(size(Xpos,1), 1) Xpos];
Xneg = [ones(size(Xneg,1), 1) Xneg];
X = [Xpos; Xneg];
y = [ypos; yneg];
% Some useful variables
m = size(X, 1);
n = size(X, 2);

% zero initial theta
initial_theta = zeros(n, 1);

% train it
options = optimset('GradObj', 'on', 'MaxIter', 50);
lambda = 0.03;
[theta] = ...
         fmincg (@(t)(lrCostFunction(t, X, y, lambda)), ...
                 initial_theta, options);

save ws_theta.mat theta; 
ppos = sigmoid(Xpos*theta);
pneg = sigmoid(Xneg*theta);

% load test set
[Xpos, Xneg, ypos, yneg] = load_set("test", "*.png");
Xtp = Xpos;
Xtn = Xneg;
[Xpos, Xneg, ypos, yneg] = load_set("test", "*.jpg");
Xpos = [Xtp; Xpos];
Xneg = [Xtn; Xneg];
Xpos = [ones(size(Xpos,1), 1) Xpos];
Xneg = [ones(size(Xneg,1), 1) Xneg];

testpos = sigmoid(Xpos*theta);
testneg = sigmoid(Xneg*theta);