

function plot_error_bar_random_pve_slope_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1) * 100;
	[num_exp, num_charts] = size(data_matrix);

	%data_matrix(data_matrix == 0) = NaN;

	num_of_method = 3;
	num_of_sd = 9;

	lr_on_cbf_matrix  = zeros(num_of_method, num_of_sd);
	lr_on_data_matrix = zeros(num_of_method, num_of_sd);
	no_pvc_matrix     = zeros(num_of_method, num_of_sd);
	spatial_matrix    = zeros(num_of_method, num_of_sd);

	lr_on_cbf_index  = 1;
	lr_on_data_index = 1;
	no_pvc_index     = 1;
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

		% No PVC
		if(mod(i, 5) == 3)
			no_pvc_matrix(:, no_pvc_index) = data_matrix(:, i);
			no_pvc_index = no_pvc_index + 1;
			continue;
		end

		% spatial
		if(mod(i, 5) == 4)
			spatial_matrix(:, spatial_index) = data_matrix(:, i);
			spatial_index = spatial_index + 1;
			continue;
		end

			
	end

	%lr_on_cbf_matrix
	%lr_on_data_matrix
	%spatial_matrix

	%x = 0 : 5 : 30;
	x = 0 : 5 : 40;


	figure_position = [2 2 15 20];

	current_figure = figure;

	% LR on cbf
	vc1 = abs(lr_on_cbf_matrix(1, :) - lr_on_cbf_matrix(2, :));
	vc2 = lr_on_cbf_matrix(2, :);
	vc3 = abs(lr_on_cbf_matrix(2, :) - lr_on_cbf_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_sd), vc3(:,1:num_of_sd), vc1(:,1:num_of_sd), '.-r', 'LineWidth', 3, 'MarkerSize', 25);

	
	hold on;

	% LR on data
	vc1 = abs(lr_on_data_matrix(1, :) - lr_on_data_matrix(2, :));
	vc2 = lr_on_data_matrix(2, :);
	vc3 = abs(lr_on_data_matrix(2, :) - lr_on_data_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_sd), vc3(:,1:num_of_sd), vc1(:,1:num_of_sd), '.-g', 'LineWidth', 3, 'MarkerSize', 25);

	hold on;

	% No PVC
	vc1 = abs(no_pvc_matrix(1, :) - no_pvc_matrix(2, :));
	vc2 = no_pvc_matrix(2, :);
	vc3 = abs(no_pvc_matrix(2, :) - no_pvc_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_sd), vc3(:,1:num_of_sd), vc1(:,1:num_of_sd), '.-k', 'LineWidth', 3, 'MarkerSize', 25);

	hold on;

	% Spatial
	vc1 = abs(spatial_matrix(1, :) - spatial_matrix(2, :));
	vc2 = spatial_matrix(2, :);
	vc3 = abs(spatial_matrix(2, :) - spatial_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_sd), vc3(:,1:num_of_sd), vc1(:,1:num_of_sd), '.-b', 'LineWidth', 3, 'MarkerSize', 25);
	

	title('Flat GM CBF', 'FontSize', 22, 'FontWeight', 'bold');
	ylabel('Slope (ml/100g/min/%)', 'FontSize', 20, 'FontWeight', 'bold');
	xlabel('Standard Deviation (\sigma)', 'FontSize', 20, 'FontWeight', 'bold');

	set(gca, 'XLim', [-2 42]);
	set(gca, 'XTickLabel', {'0', '0.05', '0.1', '0.15', '0.2'});
	set(gca, 'YLim', [-30 50] * 100);

	%legend('LR on CBF', 'LR on ASL data', 'Spatially Regularised');

	set(gca, 'fontsize', 20);

	% Set Figure position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');


end

