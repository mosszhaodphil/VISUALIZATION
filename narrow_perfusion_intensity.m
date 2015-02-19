function perfusion_matrix_narrow = narrow_perfusion_intensity(perfusion_matrix)
	[x, y, z] = size(perfusion_matrix);
	perfusion_matrix_narrow = perfusion_matrix;
	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				if(perfusion_matrix(i, j, k) <= 0)
					perfusion_matrix_narrow(i, j, k) = 0;
				end
				if(perfusion_matrix(i, j, k) >= 155)
					perfusion_matrix_narrow(i, j, k) = 155;
				end
			end
		end
	end
end