

function plot_error_bar_random_pve_slope_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1) * 100
	[num_exp, num_charts] = size(data_matrix)

	%data_matrix(data_matrix == 0) = NaN;

	num_of_method = 3;
	num_of_bias = 6;

	lr_on_cbf_matrix  = zeros(num_of_method, num_of_bias);
	lr_on_data_matrix = zeros(num_of_method, num_of_bias);
	spatial_matrix    = zeros(num_of_method, num_of_bias);

	lr_on_cbf_index  = 1;
	lr_on_data_index = 1;
	spatial_index    = 1;

	for i = 1 : num_charts

		% LR on CBF
		if(mod(i, 5) == 1)
			lr_on_cbf_matrix(:, lr_on_cbf_index) = data_matrix(:, i);
			lr_on_cbf_index = lr_on_cbf_index + 1;
			continue;
		end

		
		% LR on data
		if(mod(i, 5) == 2)
			lr_on_data_matrix(:, lr_on_data_index) = data_matrix(:, i);
			lr_on_data_index = lr_on_data_index + 1;
			continue;
		end

		% Spatial
		if(mod(i, 5) == 4)
			spatial_matrix(:, spatial_index) = data_matrix(:, i);
			spatial_index = spatial_index + 1;
			continue;
		end

			
	end

	%x = 0 : 5 : 30;
	x = 0 : 5 : 25;

	figure_position = [2 2 15 20];

	current_figure = figure;
	% LR on cbf
	vc1 = abs(lr_on_cbf_matrix(1, :) - lr_on_cbf_matrix(2, :));
	vc2 = lr_on_cbf_matrix(2, :);
	vc3 = abs(lr_on_cbf_matrix(2, :) - lr_on_cbf_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_bias), vc3(:,1:num_of_bias), vc1(:,1:num_of_bias), '.-r', 'LineWidth', 2, 'MarkerSize', 20);

	
	hold on;

	% LR on data
	vc1 = abs(lr_on_data_matrix(1, :) - lr_on_data_matrix(2, :));
	vc2 = lr_on_data_matrix(2, :);
	vc3 = abs(lr_on_data_matrix(2, :) - lr_on_data_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_bias), vc3(:,1:num_of_bias), vc1(:,1:num_of_bias), '.-g', 'LineWidth', 2, 'MarkerSize', 20);

	hold on;

	% Spatial
	vc1 = abs(spatial_matrix(1, :) - spatial_matrix(2, :));
	vc2 = spatial_matrix(2, :);
	vc3 = abs(spatial_matrix(2, :) - spatial_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_bias), vc3(:,1:num_of_bias), vc1(:,1:num_of_bias), '.-b', 'LineWidth', 2, 'MarkerSize', 20);
	

	title('Flat GM CBF', 'FontSize', 20, 'FontWeight', 'bold');
	ylabel('Slope (ml/100g/min/%)', 'FontSize', 16, 'FontWeight', 'bold');
	xlabel('Bias Factor', 'FontSize', 16, 'FontWeight', 'bold');

	x_lim = [-2 27];
	y_lim = [-35 35] * 100;

	set(gca, 'XLim', x_lim);
	set(gca, 'XTickLabel', {'0','0.1','0.2','0.3','0.4', '0.5'});

	set(gca, 'YLim', y_lim);
	%set(gca, 'YTickLabel', {'','0','','2','','4','','6','','8'});

	set(gca, 'fontsize', 14);

	%legend('LR on CBF', 'LR on ASL data', 'Spatially Regularised');

	% Set Figure position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');
	%print('cbf flat bias under slope','-dpng','-r300');
end

