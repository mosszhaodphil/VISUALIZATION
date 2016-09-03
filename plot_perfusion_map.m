% This funciton generates the montage of all the slices of perfusion maps along z direction.
% All negative voxels are converted to zero
% The function returns the figur handle of the montage (must be saved manually).
% Input parameter: 3D perfusion matrix

function figure_handle = plot_montage(input_matrix, colormap_type)

	[x, y, z] = size(input_matrix); % get the dimension of the perfusion matrix

	% Some perfusion values can be negative
	% We assign zero to these voxels
	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				if(input_matrix(i, j, k) <= 0)
					input_matrix(i, j, k) = 0;
				end
			end
		end
	end

	% In Matlab, the montage volume must be in x by y by 1 by k dimension
	% K is the number of slices, in this case z
	montage_volume = zeros(x, y, 1, z);
	for j = 1 : z
		montage_volume(:, :, 1, j) = input_matrix(:, :, j);
	end

	% Display the montage
	figure;
	figure_handle = montage(montage_volume, colormap(colormap_type));
	colorbar;


	% Set Figure position
	current_figure.Units = 'centimeters';
	%current_figure.Position = figure_position;


	% Output image
	%print('_FILE_NAME','-dpng','-r300');

end

