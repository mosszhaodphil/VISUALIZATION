% This function rotate a 3D matrix by rotate_angle degrees counterclock wise.
% The function assumes z direction is fixed.
% perfusion_matrix(:, :, z) is to be rotated.
% rotate_angle is the angle (in degrees) to be rotated.

function perfusion_matrix_rotate = rotate_perfusion_matrix(perfusion_matrix, rotate_angle)

	% Construct an empty matrix to save the rotation result
	[x, y, z] = size(perfusion_matrix);
	perfusion_matrix_rotate = zeros(x, y, z);

	% rotate perfusion matrix to rotate_angle degrees
	for i = 1 : z
		perfusion_matrix_rotate(:, :, i) = imrotate(perfusion_matrix(:, :, i), rotate_angle);
	end
end