
function [] = visualize_perfusion(file_name)

	file_handle = load_nii(file_name);
	matrix_r = rotate_matrix(file_handle.img, 90);
	plot_montage(matrix_r, 'hot');
end
