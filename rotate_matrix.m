% This function rotate a 3D matrix by rotate_angle degrees counterclock wise.
% The function assumes z direction is fixed.
% input_matrix(:, :, z) is to be rotated.
% rotate_angle is the angle (in degrees) to be rotated.

function output_matrix = rotate_matrix(input_matrix, rotate_angle)

	% Construct an empty matrix to save the rotation result
	[x, y, z] = size(input_matrix);
	output_matrix = zeros(x, y, z);

	% rotate perfusion matrix to rotate_angle degrees
	for i = 1 : z
		output_matrix(:, :, i) = imrotate(input_matrix(:, :, i), rotate_angle);
	end
end