

function display_perfusion_map(file_name)

	file_handle = load_nii(strcat(file_name, '.nii.gz'));
	data = rot90(file_handle.img);

	[x, y, z] = size(data);

	im = data(:, :, ceil(z / 2) );

	current_figure = figure;

	imagesc(im);

	colormap hot;

	caxis([40 80]);
	set(gca, 'XTick', []);
	set(gca, 'YTick', []);

	hold on;

	imtool(im);

	% Set Figure position
	figure_position = [2 2 21.05 21.05];
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');
end

