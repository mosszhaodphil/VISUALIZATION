

function [] = plot_perfusion_map(perfusion_matrix)

	%perfusion_matrix_abs = abs(perfusion_matrix);
	[x, y, z] = size(perfusion_matrix);

	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				if(perfusion_matrix(i, j, k) <= 0)
					perfusion_matrix(i, j, k) = 0;
				end
			end
		end
	end

	montage_volume = zeros(x, y, 1, z);

	for j = 1 : z
		montage_volume(:, :, 1, j) = perfusion_matrix(:, :, j);
	end

	montage(montage_volume, colormap('hot'));
	colorbar;
end