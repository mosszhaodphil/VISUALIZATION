

function perfusion_matrix_rotate = rotate_perfusion_matrix(perfusion_matrix, rotate_angle)

	%perfusion_matrix_abs = abs(perfusion_matrix);
	[x, y, z] = size(perfusion_matrix);
	perfusion_matrix_rotate = zeros(x, y, z);

	% rotate perfusion matrix to rotate_angle degrees
	for i = 1 : z
		perfusion_matrix_rotate(:, :, i) = imrotate(perfusion_matrix(:, :, i), rotate_angle);
	end
end