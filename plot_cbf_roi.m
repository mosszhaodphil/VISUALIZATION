


function image_handle = plot_cbf_roi(file_egill, file_multi, file_spatial)

	file_extension = '.txt';
	formatSpec = '%f'; % read data in floating point format

	% load data from text file
	file_handle_egill   = fopen(strcat(file_egill, file_extension), 'r');
	file_handle_multi   = fopen(strcat(file_multi, file_extension), 'r');
	file_handle_spatial = fopen(strcat(file_spatial, file_extension), 'r');
	cbf_roi_egill   = fscanf(file_handle_egill,formatSpec);
	cbf_roi_multi   = fscanf(file_handle_multi,formatSpec);
	cbf_roi_spatial = fscanf(file_handle_spatial,formatSpec);

	% find limit of x and y axis
	data = [cbf_roi_egill; cbf_roi_multi; cbf_roi_spatial];
	xmin = 10;
	xmax = 100;
	ymin = min(data(:)) - 0.3;
	ymax = max(data(:)) + 0.3;

	% x axis
	x = 15 : 10 : 95;

	% start plotting
	figure;

	line_1 = plot(x, cbf_roi_egill, '-b*');
	hold on;
	line_2 = plot(x, cbf_roi_multi, '-ro');
	hold on;
	line_3 = plot(x, cbf_roi_spatial, '-gs');

	axis([xmin xmax ymin ymax]); % set x and y axis limit

	set([line_1 line_2 line_3], 'LineWidth', 1.5); % Set line thickness

	xlabel('GM PVE %');
	ylabel('Mean CBF ratio');

	legend('Egill T1 Seg', 'Multi TI Asllani', 'Spatial VB');
	title('Dataset 6');

	fclose(file_handle_egill);
	fclose(file_handle_multi);
	fclose(file_handle_spatial);

end

