% This function compares two time series
% It draws one on top of another

function compare_curve(file_1, file_2)

	file_extension = '.nii.gz';

	file_handle_1 = load_nii(strcat(file_1, file_extension));
	file_handle_2 = load_nii(strcat(file_2, file_extension));

	matrix_1 = file_handle_1.img;
	matrix_2 = file_handle_2.img;

	vector_1 = matrix_1(5, 1, 1, :);
	vector_2 = matrix_2(1, 1, 5, :);

	%vector_1 = matrix_1(1, 1, 1, :);
	%vector_2 = matrix_2(1, 1, 1, :);

	vector_1 = vector_1(:);
	vector_2 = vector_2(:);

	figure;

	plot(vector_1, 'b');

	hold on;

	plot(vector_2, 'r');

	legend(file_1, file_2);


end


