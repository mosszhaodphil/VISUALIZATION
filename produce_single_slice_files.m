


function produce_single_slice_files(input_file_name)

	file_handle = load_nii(strcat(input_file_name, '.nii.gz'));

	intput_matrix = file_handle.img;

	dimension = ndims(intput_matrix);

	mkdir('temp_x');
	mkdir('temp_y');
	mkdir('temp_z');

	if(dimension == 3)
		[x, y, z] = size(intput_matrix);

		% X dimension
		for i = 1 : x
			cd('temp_x');
			current_matrix = rot90(reshape(intput_matrix(i, :, :), [y, z]));
			imwrite(current_matrix, strcat(num2str(i), '.png'));
			cd('../');
		end

		% Y dimension
		for i = 1 : y
			cd('temp_y');
			current_matrix = rot90(reshape(intput_matrix(:, i, :), [x, z]));
			imwrite(current_matrix, strcat(num2str(i), '.png'));
			cd('../');
		end

		% Z dimension
		for i = 1 : z
			cd('temp_z');
			current_matrix = rot90(reshape(intput_matrix(:, :, i), [x, y]));
			imwrite(current_matrix, strcat(num2str(i), '.png'));
			cd('../');
		end


	end

	if(dimension == 4)
		[x, y, z, t] = size(intput_matrix);

		% X dimension
		for i = 1 : x
			cd('temp_x');

			cd('../');
		end

		% Y dimension
		for i = 1 : y
			cd('temp_y');

			cd('../');
		end

		% Z dimension
		for i = 1 : z
			cd('temp_z');

			cd('../');
		end

		% T dimension
		for i = 1 : t
			mkdir('temp_t');
			cd('temp_t');

			cd('../');
		end

	end


end
