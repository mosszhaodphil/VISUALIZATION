

function [] = calculate_fractional_anisotropy(gm_file, wm_file, csf_file, mask_file)

	file_extension = '.nii.gz';
	gm_handle = load_nii(strcat(gm_file, file_extension));
	wm_handle = load_nii(strcat(wm_file, file_extension));
	csf_handle = load_nii(strcat(csf_file, file_extension));
	mask_handle = load_nii(strcat(mask_file, file_extension));

	gm_matrix = gm_handle.img;
	wm_matrix = wm_handle.img;
	csf_matrix = csf_handle.img;
	mask_matrix = mask_handle.img;

	[x, y, z] = size(mask_matrix);

	result_matrix = zeros(x, y, z);

	for i = 1 : x
		for j = 1 : y
			for k = 1 : z
				if(mask_matrix(i, j, k) <=0)
					continue;
				end

				num = (gm_matrix(i, j, k) - wm_matrix(i, j, k)) ^ 2 + (wm_matrix(i, j, k) - csf_matrix(i, j, k)) ^ 2 + (gm_matrix(i, j, k) - csf_matrix(i, j, k)) ^ 2;

				den = (gm_matrix(i, j, k)) ^ 2 + (wm_matrix(i, j, k)) ^ 2 + (csf_matrix(i, j, k)) ^ 2;
				
				result_matrix(i, j, k) = sqrt(0.5 * num / den);

			end

		end
	end

	gm_handle.img = result_matrix;

	save_nii(gm_handle, 'FA.nii.gz');

end

