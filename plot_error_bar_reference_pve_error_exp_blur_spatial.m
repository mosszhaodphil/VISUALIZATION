

function plot_error_bar_random_pve_error_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1)
	[num_exp, num_charts] = size(data_matrix)

	%data_matrix(data_matrix == 0) = NaN;

	num_of_method = 3;
	num_of_sd = 7;

	spatial_0_matrix = zeros(num_of_method, num_of_sd);
	spatial_1_matrix = zeros(num_of_method, num_of_sd);
	spatial_2_matrix = zeros(num_of_method, num_of_sd);
	spatial_3_matrix = zeros(num_of_method, num_of_sd);

	spatial_0_index = 1;
	spatial_1_index = 1;
	spatial_2_index = 1;
	spatial_3_index = 1;

	for i = 1 : num_charts

		% LR on CBF
		if(mod(i, 5) == 1)
			spatial_0_matrix(:, spatial_0_index) = data_matrix(:, i);
			spatial_0_index = spatial_0_index + 1;
			continue;
		end

		
		% LR on CBF
		if(mod(i, 5) == 2)
			spatial_1_matrix(:, spatial_1_index) = data_matrix(:, i);
			spatial_1_index = spatial_1_index + 1;
			continue;
		end

		% LR on CBF
		if(mod(i, 5) == 3)
			spatial_2_matrix(:, spatial_2_index) = data_matrix(:, i);
			spatial_2_index = spatial_2_index + 1;
			continue;
		end

		% LR on CBF
		if(mod(i, 5) == 4)
			spatial_3_matrix(:, spatial_3_index) = data_matrix(:, i);
			spatial_3_index = spatial_3_index + 1;
			continue;
		end

			
	end

	%spatial_0_matrix
	%spatial_1_matrix
	%spatial_2_matrix

	%x = 0 : 5 : 30;
	x = 0 : 5 : 20;

	figure_position = [2 2 10 15];

	current_figure = figure;
	% LR on cbf
	vc1 = abs(spatial_0_matrix(1, :) - spatial_0_matrix(2, :));
	vc2 = spatial_0_matrix(2, :);
	vc3 = abs(spatial_0_matrix(2, :) - spatial_0_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), '.-r', 'LineWidth', 2, 'MarkerSize', 20);

	
	hold on;

	% LR on cbf
	vc1 = abs(spatial_1_matrix(1, :) - spatial_1_matrix(2, :));
	vc2 = spatial_1_matrix(2, :);
	vc3 = abs(spatial_1_matrix(2, :) - spatial_1_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), '.-g', 'LineWidth', 2, 'MarkerSize', 20);

	hold on;

	% LR on cbf
	vc1 = abs(spatial_2_matrix(1, :) - spatial_2_matrix(2, :));
	vc2 = spatial_2_matrix(2, :);
	vc3 = abs(spatial_2_matrix(2, :) - spatial_2_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), '.-b', 'LineWidth', 2, 'MarkerSize', 20);

	% LR on cbf
	vc1 = abs(spatial_3_matrix(1, :) - spatial_3_matrix(2, :));
	vc2 = spatial_3_matrix(2, :);
	vc3 = abs(spatial_3_matrix(2, :) - spatial_3_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), '.-k', 'LineWidth', 2, 'MarkerSize', 20);
	

	title('Hyper/Hypo GM CBF', 'FontSize', 20, 'FontWeight', 'bold');
	ylabel('RMSE', 'FontSize', 16, 'FontWeight', 'bold');
	xlabel('SNR', 'FontSize', 16, 'FontWeight', 'bold');

	set(gca, 'XLim', [-2 22]);
	set(gca, 'XTickLabel', {'5','10','15','20','INF'});

	set(gca, 'YLim', [0 10]);
	%set(gca, 'YTickLabel', {'','0','','2','','4','','6','','8'});

	set(gca, 'fontsize', 14);

	%legend('Original', 'Sigma=1.5', 'Sigma=1.75', 'Sigma=2');

	% Set Figure position
	current_figure.Units = 'centimeters';
	current_figure.Position = figure_position;


	% Output image
	print('_FILE_NAME','-dpng','-r300');
end

