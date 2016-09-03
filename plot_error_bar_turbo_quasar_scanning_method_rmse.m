

function plot_error_bar_random_pve_slope_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1)
	[num_exp, num_charts] = size(data_matrix)

	%data_matrix(data_matrix == 0) = NaN;

	num_of_fitting_method = 2; % Two methods: 1 two-sep, 2 100 iterations
	num_of_scanning_method = 6; % Six scanning methods

	two_step_results_matrix     = zeros(3, num_of_scanning_method);
	iteration_results_matrix    = zeros(3, num_of_scanning_method);

	spatial_matrix       = zeros(3, num_of_scanning_method);
	no_correction_matrix = zeros(3, num_of_scanning_method);

	two_step_results_index  = 1;
	iteration_results_index = 1;

	spatial_index    = 1;
	no_index         = 1;

	for i = 1 : num_charts

		% Two step fitting results
		if(mod(i, num_of_fitting_method) == 1)
			two_step_results_matrix(:, two_step_results_index) = data_matrix(:, i);
			two_step_results_index = two_step_results_index + 1;
			continue;
		end

		
		% 100 iterations fitting results
		if(mod(i, num_of_fitting_method) == 0)
			iteration_results_matrix(:, iteration_results_index) = data_matrix(:, i);
			iteration_results_index = iteration_results_index + 1;
			continue;
		end

		%{
		% LR on CBF
		if(mod(i, 5) == 4)
			spatial_matrix(:, spatial_index) = data_matrix(:, i);
			spatial_index = spatial_index + 1;
			continue;
		end

		% No Correction
		if(mod(i, 5) == 3)
			no_correction_matrix(:, no_index) = data_matrix(:, i);
			no_index = no_index + 1;
			continue;
		end
		%}
			
	end

	%two_step_results_matrix
	%iteration_results_matrix
	%spatial_matrix

	%x = 0 : 5 : 30;
	x = 0 : 5 : 25;

	figure_position = [2 2 20 20];

	line_width = 3;
	marker_size = 10;

	current_figure = figure;

	% 100 Iterations
	vc1 = abs(two_step_results_matrix(1, :) - two_step_results_matrix(2, :));
	vc2 = two_step_results_matrix(2, :);
	vc3 = abs(two_step_results_matrix(2, :) - two_step_results_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_scanning_method), vc3(:,1:num_of_scanning_method), vc1(:,1:num_of_scanning_method), 'o:b', 'LineWidth', line_width, 'MarkerSize', marker_size, 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k');

	
	hold on;

	% Two steps
	vc1 = abs(iteration_results_matrix(1, :) - iteration_results_matrix(2, :));
	vc2 = iteration_results_matrix(2, :);
	vc3 = abs(iteration_results_matrix(2, :) - iteration_results_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_scanning_method), vc3(:,1:num_of_scanning_method), vc1(:,1:num_of_scanning_method), 'o:r', 'LineWidth', line_width, 'MarkerSize', marker_size, 'MarkerFaceColor', 'r', 'MarkerEdgeColor','k');

	hold on;

	%{

	% Spatial
	vc1 = abs(spatial_matrix(1, :) - spatial_matrix(2, :));
	vc2 = spatial_matrix(2, :);
	vc3 = abs(spatial_matrix(2, :) - spatial_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), 'xb', 'LineWidth', line_width, 'MarkerSize', marker_size);

	% No correction
	vc1 = abs(no_correction_matrix(1, :) - no_correction_matrix(2, :));
	vc2 = no_correction_matrix(2, :);
	vc3 = abs(no_correction_matrix(2, :) - no_correction_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), 'xk', 'LineWidth', line_width, 'MarkerSize', marker_size);

	%}

	title('SNR=10', 'FontSize', 22, 'FontWeight', 'bold');
	ylabel('RMSE', 'FontSize', 20, 'FontWeight', 'bold');
	xlabel('Protocol (sec)', 'FontSize', 20, 'FontWeight', 'bold');

	% Axis limit
	x_lower_limit = -2;
	x_upper_limit = 27;
	y_lower_limit = 0;
	y_upper_limit = 12;

	set(gca, 'XLim', [x_lower_limit x_upper_limit]);
	set(gca, 'XTickLabel', {'\Delta\tau=0.65;\DeltaTI=0.6', '\Delta\tau=1.3;\DeltaTI=0.3', '\Delta\tau=0.65;\DeltaTI=0.6', '\Delta\tau=1.3;\DeltaTI=0.3', '\Delta\tau=0.65;\DeltaTI=0.6', '\Delta\tau=1.3;\DeltaTI=0.3'});
	set(gca, 'XTickLabelRotation', 45);

	set(gca, 'YLim', [y_lower_limit y_upper_limit]);
	%set(gca, 'YTickLabel', {'','0','','2','','4','','6','','8'});

	set(gca, 'fontsize', 20);

	%legend('LR on CBF', 'LR on ASL data', 'Spatially Regularised', 'No PVC');

	% Set Figure position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');
end

