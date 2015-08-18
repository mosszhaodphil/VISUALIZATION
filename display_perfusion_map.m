

function display_perfusion_map(file_name)

	file_handle = load_nii(strcat(file_name, '.nii.gz'));
	data = rot90(file_handle.img);

	[x, y, z] = size(data);

	figure;

	image(data(:, :, ceil(z / 2) ));

	colormap hot;

	hold on;
end

