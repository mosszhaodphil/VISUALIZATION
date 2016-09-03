

function plot_error_bar_reference_pve_slope_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1) * 100;
	[num_exp, num_charts] = size(data_matrix);

	%data_matrix(data_matrix == 0) = NaN;

	num_of_results = 3;
	num_of_snr = 5;

	lr_on_cbf_matrix  = zeros(num_of_results, num_of_snr);
	lr_on_data_matrix = zeros(num_of_results, num_of_snr);
	no_pvc_matrix     = zeros(num_of_results, num_of_snr);
	spatial_matrix    = zeros(num_of_results, num_of_snr);

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

		% Spatial
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
	x = 0 : 5 : 20;

	figure_position = [2 2 15 20];

	current_figure = figure;
	% LR on cbf
	vc1 = abs(lr_on_cbf_matrix(1, :) - lr_on_cbf_matrix(2, :));
	vc2 = lr_on_cbf_matrix(2, :);
	vc3 = abs(lr_on_cbf_matrix(2, :) - lr_on_cbf_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_snr), vc3(:,1:num_of_snr), vc1(:,1:num_of_snr), '.-r', 'LineWidth', 3, 'MarkerSize', 25);

	
	hold on;

	% LR on Data
	vc1 = abs(lr_on_data_matrix(1, :) - lr_on_data_matrix(2, :));
	vc2 = lr_on_data_matrix(2, :);
	vc3 = abs(lr_on_data_matrix(2, :) - lr_on_data_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_snr), vc3(:,1:num_of_snr), vc1(:,1:num_of_snr), '.-g', 'LineWidth', 3, 'MarkerSize', 25);

	hold on;

	% Spatial
	vc1 = abs(no_pvc_matrix(1, :) - no_pvc_matrix(2, :));
	vc2 = no_pvc_matrix(2, :);
	vc3 = abs(no_pvc_matrix(2, :) - no_pvc_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_snr), vc3(:,1:num_of_snr), vc1(:,1:num_of_snr), '.-k', 'LineWidth', 3, 'MarkerSize', 25);

	hold on;

	% Spatial
	vc1 = abs(spatial_matrix(1, :) - spatial_matrix(2, :));
	vc2 = spatial_matrix(2, :);
	vc3 = abs(spatial_matrix(2, :) - spatial_matrix(3, :));
	errorbar(x, vc2(:,1:num_of_snr), vc3(:,1:num_of_snr), vc1(:,1:num_of_snr), '.-b', 'LineWidth', 3, 'MarkerSize', 25);
	

	title('Flat GM CBF', 'FontSize', 22, 'FontWeight', 'bold');
	ylabel('Slope (ml/100g/min/%)', 'FontSize', 20, 'FontWeight', 'bold');
	xlabel('SNR', 'FontSize', 20, 'FontWeight', 'bold');

	set(gca, 'XLim', [-2 22]);
	set(gca, 'XTickLabel', {'5','10','15','20','INF'});

	set(gca, 'YLim', [-30 50] * 100);
	%set(gca, 'YTickLabel', {'','0','','2','','4','','6','','8'});

	set(gca, 'fontsize', 20);

	%legend('LR on CBF', 'LR on ASL data', 'No PVC', 'Spatially Regularised');

	% Set Figure position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');
end

