

function plot_error_bar_random_pve_error_exp(file_under, file_over)

	% Read in the data from the input text file
	data_matrix_under = dlmread(file_under) * 100
	[num_exp, num_charts] = size(data_matrix_under)

	%data_matrix_under(data_matrix_under == 0) = NaN;

	num_of_method = 3;
	num_of_bias_under = 6;

	lr_on_cbf_matrix_under  = zeros(num_of_method, num_of_bias_under);
	lr_on_data_matrix_under = zeros(num_of_method, num_of_bias_under);
	spatial_matrix_under    = zeros(num_of_method, num_of_bias_under);

	lr_on_cbf_under_index  = 1;
	lr_on_data_under_index = 1;
	spatial_under_index    = 1;

	for i = 1 : num_charts

		% LR on CBF
		if(mod(i, 5) == 1)
			lr_on_cbf_matrix_under(:, lr_on_cbf_under_index) = data_matrix_under(:, i);
			lr_on_cbf_under_index = lr_on_cbf_under_index + 1;
			continue;
		end

		
		% LR on data
		if(mod(i, 5) == 2)
			lr_on_data_matrix_under(:, lr_on_data_under_index) = data_matrix_under(:, i);
			lr_on_data_under_index = lr_on_data_under_index + 1;
			continue;
		end

		% Spatial
		if(mod(i, 5) == 4)
			spatial_matrix_under(:, spatial_under_index) = data_matrix_under(:, i);
			spatial_under_index = spatial_under_index + 1;
			continue;
		end

			
	end

	% flip the data
	lr_on_cbf_matrix_under = fliplr(lr_on_cbf_matrix_under);
	lr_on_data_matrix_under = fliplr(lr_on_data_matrix_under);
	spatial_matrix_under = fliplr(spatial_matrix_under)





	% Read in the data from the input text file
	data_matrix_over = dlmread(file_over) * 100
	[num_exp, num_charts] = size(data_matrix_over)

	%data_matrix_over(data_matrix_over == 0) = NaN;

	num_of_method = 3;
	num_of_bias_over = 6; 

	lr_on_cbf_matrix_over  = zeros(num_of_method, num_of_bias_over);
	lr_on_data_matrix_over = zeros(num_of_method, num_of_bias_over);
	spatial_matrix_over    = zeros(num_of_method, num_of_bias_over);

	lr_on_cbf_over_index  = 1;
	lr_on_data_over_index = 1;
	spatial_over_index    = 1;

	for i = 1 : num_charts

		% LR on CBF
		if(mod(i, 5) == 1)
			lr_on_cbf_matrix_over(:, lr_on_cbf_over_index) = data_matrix_over(:, i);
			lr_on_cbf_over_index = lr_on_cbf_over_index + 1;
			continue;
		end

		
		% LR on data
		if(mod(i, 5) == 2)
			lr_on_data_matrix_over(:, lr_on_data_over_index) = data_matrix_over(:, i);
			lr_on_data_over_index = lr_on_data_over_index + 1;
			continue;
		end

		% Spatial
		if(mod(i, 5) == 4)
			spatial_matrix_over(:, spatial_over_index) = data_matrix_over(:, i);
			spatial_over_index = spatial_over_index + 1;
			continue;
		end

			
	end


	% zero is duplicated with bias under results
	lr_on_cbf_matrix_over  = lr_on_cbf_matrix_over(:, 2 : end);
	lr_on_data_matrix_over = lr_on_data_matrix_over(:, 2 : end);
	spatial_matrix_over    = spatial_matrix_over(:, 2 : end);

	% Concatinate under and over matrix
	lr_on_cbf_matrix  = horzcat(lr_on_cbf_matrix_under, lr_on_cbf_matrix_over);
	lr_on_data_matrix = horzcat(lr_on_data_matrix_under, lr_on_data_matrix_over);
	spatial_matrix    = horzcat(spatial_matrix_under, spatial_matrix_over);

	num_of_bias = num_of_bias_over + num_of_bias_under - 1;


	%x = 0 : 5 : 30;
	x = 0 : 5 : 50;

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
	

	title('Fast Sinusoidal GM CBF Variation', 'FontSize', 20, 'FontWeight', 'bold');
	ylabel('Slope (ml/100g/min/%)', 'FontSize', 16, 'FontWeight', 'bold');
	xlabel('Bias Factor', 'FontSize', 16, 'FontWeight', 'bold');

	x_lim = [-2 52];
	y_lim = [-1 8] * 100;

	set(gca, 'XLim', x_lim);
	set(gca, 'XTickLabel', {'-0.5', '-0.3', '-0.1', '0.1', '0.3', '0.5'});

	set(gca, 'YLim', y_lim);
	%set(gca, 'YTickLabel', {'','0','','2','','4','','6','','8'});

	set(gca, 'fontsize', 14);

	%legend('LR on CBF', 'LR on ASL data', 'Spatially Regularised');

	% Set Figure position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');
	print('cbf sine6 bias under RMSE','-dpng','-r300');


end

