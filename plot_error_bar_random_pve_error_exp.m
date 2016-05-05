

function plot_error_bar_random_pve_error_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1)
	[num_exp, num_charts] = size(data_matrix)

	%data_matrix(data_matrix == 0) = NaN;

	num_of_method = 3;
	num_of_sd = 7;

	lr_on_cbf_matrix  = zeros(num_of_method, num_of_sd);
	lr_on_data_matrix = zeros(num_of_method, num_of_sd);
	spatial_matrix    = zeros(num_of_method, num_of_sd);

	lr_on_cbf_index  = 1;
	lr_on_data_index = 1;
	spatial_index    = 1;

	for i = 1 : num_charts

		% LR on CBF
		if(mod(i, 4) == 1)
			lr_on_cbf_matrix(:, lr_on_cbf_index) = data_matrix(:, i);
			lr_on_cbf_index = lr_on_cbf_index + 1;
			continue;
		end

		
		% LR on CBF
		if(mod(i, 4) == 2)
			lr_on_data_matrix(:, lr_on_data_index) = data_matrix(:, i);
			lr_on_data_index = lr_on_data_index + 1;
			continue;
		end

		% LR on CBF
		if(mod(i, 4) == 3)
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

	figure;
	% LR on cbf
	vc1 = abs(lr_on_cbf_matrix(1, :) - lr_on_cbf_matrix(2, :));
	vc2 = lr_on_cbf_matrix(2, :);
	vc3 = abs(lr_on_cbf_matrix(2, :) - lr_on_cbf_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), '.-r');

	
	hold on;

	% LR on cbf
	vc1 = abs(lr_on_data_matrix(1, :) - lr_on_data_matrix(2, :));
	vc2 = lr_on_data_matrix(2, :);
	vc3 = abs(lr_on_data_matrix(2, :) - lr_on_data_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), '.-g');

	hold on;

	% LR on cbf
	vc1 = abs(spatial_matrix(1, :) - spatial_matrix(2, :));
	vc2 = spatial_matrix(2, :);
	vc3 = abs(spatial_matrix(2, :) - spatial_matrix(3, :));
	errorbar(x, vc2(:,1:5), vc3(:,1:5), vc1(:,1:5), '.-b');
	

	title('Flat CBF');
	ylabel('Slope');
	xlabel('Standard Deviation');

	set(gca, 'XLim', [-2 22]);
	set(gca, 'YLim', [-20 6]);

	legend('LR on CBF', 'LR on ASL data', 'Spatially Regularised');


end

