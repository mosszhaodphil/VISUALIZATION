

function display_perfusion_map(file_name)

	file_handle = load_nii(strcat(file_name, '.nii.gz'));
	data = rot90(file_handle.img);

	[x, y, z] = size(data);

	im = data(:, :, ceil(z / 2) );

	figure;

	imagesc(im);

	colormap hot;

	caxis([0 120]);
	set(gca, 'XTick', []);
	set(gca, 'YTick', [])

	hold on;

	imtool(im);
end

