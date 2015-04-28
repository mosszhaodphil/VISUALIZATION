


function calculate_mean_cbf(file_1, file_2, file_3, file_4, file_5, file_6)

	output_file_name = 'Mean_GM_CBF.txt';
	file_handle = fopen(output_file_name, 'wt');

	file_extension = '.nii.gz';

	file_handle_1 = load_nii(strcat(file_1, file_extension));
	file_handle_2 = load_nii(strcat(file_2, file_extension));
	file_handle_3 = load_nii(strcat(file_3, file_extension));
	file_handle_4 = load_nii(strcat(file_4, file_extension));
	file_handle_5 = load_nii(strcat(file_5, file_extension));
	file_handle_6 = load_nii(strcat(file_6, file_extension));

	matrix_1 = file_handle_1.img;
	matrix_2 = file_handle_2.img;
	matrix_3 = file_handle_3.img;
	matrix_4 = file_handle_4.img;
	matrix_5 = file_handle_5.img;
	matrix_6 = file_handle_6.img;

	mean_1 = mean(nonzeros(matrix_1(:)));
	mean_2 = mean(nonzeros(matrix_2(:)));
	mean_3 = mean(nonzeros(matrix_3(:)));
	mean_4 = mean(nonzeros(matrix_4(:)));
	mean_5 = mean(nonzeros(matrix_5(:)));
	mean_6 = mean(nonzeros(matrix_6(:)));

	fprintf(file_handle, '%f\n%f\n%f\n%f\n%f\n%f\n', mean_1, mean_2, mean_3, mean_4, mean_5, mean_6);

	fclose all;

end
