function [Xpos, Xneg, ypos, yneg] = load_set(set_dir, file_ext)
	% change to directory with set of examples, positive examples are located in pos, negative in neg

	save_dir = pwd;
	% Load examples
	cd(set_dir);

	% positive examples
	cd("pos");
	Xpos = [];
	ypos = [];
	[Xpos, ypos] = do_imread(file_ext, 1);
	cd("..");

	% negative examples
	cd("neg");
	Xneg = [];
	yneg = [];
	[Xneg, yneg] = do_imread(file_ext, 0);
	cd("..");
	cd(save_dir);
endfunction

function [X, y] = do_imread(file_ext, y_label)
	X = [];
	y = [];
	file_list = dir(file_ext);
	num_examples = size(file_list, 1);

	for i=1:num_examples,
		img = double(imread(file_list(i).name));
		
		if length(size(img)) != 2 || size(img) != [30 30],
			printf("Bad file!: %s\n", file_list(i).name);
			continue;
		end
		X = [X; img(:)'];
		y = [y; y_label];
	end
endfunction

function testf(string)
	printf("Testing %s!\n", string);
endfunction
