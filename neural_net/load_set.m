function [X, y] = load_set(set_dir, file_ext, y_index, num_labels)
	% change to directory with set of examples, positive examples are located in pos, negative in neg

	save_dir = pwd;
	% Load examples
	cd(set_dir);
	
	X = [];
	y = [];
    y_label = zeros(num_labels,1);
	y_label(y_index) = 1;
	[X, y] = do_imread(file_ext, y_label);
	
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
		y = [y y_label];
	end
endfunction

function testf(string)
	printf("Testing %s!\n", string);
endfunction
