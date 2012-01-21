% create data set
% load training set, 27 classes
num_labels = 5

[X1, y1] = load_set("training/bs_bb", "*.png", 1);
[X2, y2] = load_set("training/bs_bk", "*.png", 1);
[X3, y3] = load_set("training/bs_blank", "*.png", 2);
[X4, y4] = load_set("training/bs_bn", "*.png", 1);
[X5, y5] = load_set("training/bs_bp", "*.png", 1);
[X6, y6] = load_set("training/bs_bq", "*.png", 1);
[X7, y7] = load_set("training/bs_br", "*.png", 1);
[X8, y8] = load_set("training/bs_wb", "*.png", 1);
[X9, y9] = load_set("training/bs_wk", "*.png", 1);
[X10, y10] = load_set("training/bs_wn", "*.png", 1);
[X11, y11] = load_set("training/bs_wp", "*.png", 1);
[X12, y12] = load_set("training/bs_wq", "*.png", 1);
[X13, y13] = load_set("training/bs_wr", "*.png", 1);
[X14, y14] = load_set("training/neg", "*.png", 5);
[X15, y15] = load_set("training/ws_bb", "*.png", 3);
[X16, y16] = load_set("training/ws_bk", "*.png", 3);
[X17, y17] = load_set("training/ws_blank", "*.png", 4);
[X18, y18] = load_set("training/ws_bn", "*.png", 3);
[X19, y19] = load_set("training/ws_bp", "*.png", 3);
[X20, y20] = load_set("training/ws_bq", "*.png", 3);
[X21, y21] = load_set("training/ws_br", "*.png", 3);
[X22, y22] = load_set("training/ws_wb", "*.png", 3);
[X23, y23] = load_set("training/ws_wk", "*.png", 3);
[X24, y24] = load_set("training/ws_wn", "*.png", 3);
[X25, y25] = load_set("training/ws_wp", "*.png", 3);
[X26, y26] = load_set("training/ws_wq", "*.png", 3);
[X27, y27] = load_set("training/ws_wr", "*.png", 3);


X = [X1; X2; X3; X4; X5; X6; X7; X8; X9; X10; X11; X12; X13; X14; X15; X16; X17; X18; X19; X20; X21; X22; X23; X24; X25; X26; X27];
y = [y1; y2; y3; y4; y5; y6; y7; y8; y9; y10; y11; y12; y13; y14; y15; y16; y17; y18; y19; y20; y21; y22; y23; y24; y25; y26; y27];

save chessData.mat X y;