


function plot_surface(data_file_name)

	%formatSpec = '%f'; % read data in floating point format

	%file_handle = fopen(data_file_name, 'r');

	%data_matrix = fscanf(file_handle, formatSpec);

	data_matrix = importdata(data_file_name);

	figure_position = [3 3 20 18]; % x, y, width, height of figure in cm
	xlabel_position = [12 -0.5 0]; % X axis label position (x, y, z) in cm
	ylabel_position = [2.5 -0.5 0]; % Y axis label position (x, y, z) in cm

	xmin = 1;
	xmax = 8;
	ymin = 1;
	ymax = 8;

	zmin = 0;
	zmax = 8;

	current_figure = figure;

	surf(abs(data_matrix));

	%axis([xmin xmax ymin ymax zmin zmax]); % set x and y axis limit

	xlabel({'FWHM (mm) of Gaussian Filter','Applied to PVE'}, 'FontSize', 16, 'FontWeight', 'bold');
	ylabel({'FWHM (mm) of Gaussian Filter','Applied to ASL Data'}, 'FontSize', 16, 'FontWeight', 'bold')
	zlabel('RMSE', 'FontSize', 16, 'FontWeight', 'bold');

	set(gca, 'fontsize', 14, 'FontWeight', 'bold');

	% Set axis range
	set(gca, 'XLim', [xmin xmax]);
	set(gca, 'YLim', [ymin ymax]);
	set(gca, 'ZLim', [zmin zmax]);


	title('', 'FontSize', 20, 'FontWeight', 'bold');
	

	ax = gca;
	% X axis tick and label
	ax.XTickMode = 'manual';
	ax.XTick = [1.5 2.5 3.5 4.5 5.5 6.5 7.5];
	ax.XTickLabel = {'2.00', '2.25', '2.50', '2.75', '3.00', '3.25', '3.50'};
	% Y axis tick and label
	ax.YTickMode = 'manual';
	ax.YTick = [1.5 2.5 3.5 4.5 5.5 6.5 7.5];
	ax.YTickLabel = {'2.00', '2.25', '2.50', '2.75', '3.00', '3.25', '3.50'};

	colormap('jet');

	% Change position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;

	xlabh = get(gca, 'XLabel');
	ylabh = get(gca, 'YLabel');
	set(xlabh, 'Units', 'centimeters', 'Position', xlabel_position);
	set(ylabh, 'Units', 'centimeters', 'Position', ylabel_position);

	%fclose(file_handle);

end
