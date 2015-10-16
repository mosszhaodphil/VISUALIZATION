

function plot_box_chart(file_1, file_2)

	file_extension = '.nii.gz';

	file_handle_1 = load_nii(strcat(file_1, file_extension));
	file_handle_2 = load_nii(strcat(file_2, file_extension));

	matrix_1 = file_handle_1.img;
	matrix_2 = file_handle_2.img;

	[x, y, z] = size(matrix_1);

	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				if(matrix_1(i, j, k) <= 0)
					matrix_1(i, j, k) = NaN;
				end
				if(matrix_2(i, j, k) <= 0)
					matrix_2(i, j, k) = NaN;
				end
			end
		end
	end

	data_1 = matrix_1(:);
	data_2 = matrix_2(:);
	%data_1 = reshape(matrix_1, x * y * z, 1);
	%data_2 = reshape(matrix_2, x * y * z, 1);

	figure;
	boxplot([data_1 data_2]);
	h = findobj(gca, 'tag', 'Outliers');
	delete(h);


end
