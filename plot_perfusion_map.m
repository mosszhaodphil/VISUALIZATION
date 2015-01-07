% This funciton generates the montage of all the slices of perfusion maps along z direction
% Input parameter: 3D perfusion matrix

function [] = plot_perfusion_map(perfusion_matrix)

	[x, y, z] = size(perfusion_matrix); % get the dimension of the perfusion matrix

	% Some perfusion values can be negative
	% We assign zero to these voxels
	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				if(perfusion_matrix(i, j, k) <= 0)
					perfusion_matrix(i, j, k) = 0;
				end
			end
		end
	end

	% In Matlab, the montage volume must be in x by y by 1 by k dimension
	% K is the number of slices, in this case z
	montage_volume = zeros(x, y, 1, z);
	for j = 1 : z
		montage_volume(:, :, 1, j) = perfusion_matrix(:, :, j);
	end

end

