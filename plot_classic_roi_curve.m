% This function plots the ROI curve of four mean perfusion
% Input:
% Four mean perfusion value text files
% Output:
% Plot

function image_handle = plot_classic_roi_curve(input_file)

	% Read in the data from the input text file
	data_matrix = dlmread(input_file)
	[num_exp, num_charts] = size(data_matrix)

	lr_on_cbf_matrix = data_matrix(:, 1);
	lr_on_data_matrix = data_matrix(:, 2);
	no_pvc_matrix = data_matrix(:, 3);
	spatial_matrix = data_matrix(:, 4);

	% x axis
	x = 15 : 10 : 95;

	figure_position = [2 2 15 20];

	% start plotting
	current_figure = figure;

	plot(x, lr_on_cbf_matrix, '.-r', 'LineWidth', 3, 'MarkerSize', 25);
	hold on;
	plot(x, lr_on_data_matrix, '.-g', 'LineWidth', 3, 'MarkerSize', 25);
	hold on;
	plot(x, no_pvc_matrix, '.-k', 'LineWidth', 3, 'MarkerSize', 25);
	hold on;
	plot(x, spatial_matrix, '.-b', 'LineWidth', 3, 'MarkerSize', 25);
	hold on;

	title('Flat GM CBF', 'FontSize', 22, 'FontWeight', 'bold');
	ylabel('GM CBF (ml/100g/min)', 'FontSize', 20, 'FontWeight', 'bold');
	xlabel('GM ROI (%)', 'FontSize', 20, 'FontWeight', 'bold');

	set(gca, 'fontsize', 20);


	x_lim = [10 100];
	set(gca, 'XLim', x_lim);
	set(gca, 'XTickLabel', {'20', '40', '60', '80', '100'});

	y_lim = [10 80];
	set(gca, 'YLim', y_lim);

	% Set Figure position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');
	%print('cbf flat bias under slope','-dpng','-r300');

end

