

function plot_error_bar_biased_pve_error_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1)
	[num_exp, num_charts] = size(data_matrix)

	%data_matrix(data_matrix == 0) = NaN;

	%num_of_bias = 6;
	num_of_bias = 11;

	lr_on_cbf_matrix  = zeros(3, num_of_bias)
	lr_on_data_matrix = zeros(3, num_of_bias)
	spatial_matrix    = zeros(3, num_of_bias)

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

	x = 0 : 1 : 10;


	figure;
	% LR on cbf
	vc1 = abs(lr_on_cbf_matrix(1, :) - lr_on_cbf_matrix(2, :));
	vc2 = lr_on_cbf_matrix(2, :);
	vc3 = abs(lr_on_cbf_matrix(2, :) - lr_on_cbf_matrix(3, :));
	errorbar(x, vc2(:), vc3(:), vc1(:), '.-r');

	hold on;

	% LR on cbf
	vc1 = abs(lr_on_data_matrix(1, :) - lr_on_data_matrix(2, :));
	vc2 = lr_on_data_matrix(2, :);
	vc3 = abs(lr_on_data_matrix(2, :) - lr_on_data_matrix(3, :));
	errorbar(x, vc2(:), vc3(:), vc1(:), '.-g');

	hold on;

	% LR on cbf
	vc1 = abs(spatial_matrix(1, :) - spatial_matrix(2, :));
	vc2 = spatial_matrix(2, :);
	vc3 = abs(spatial_matrix(2, :) - spatial_matrix(3, :));
	errorbar(x, vc2(:), vc3(:), vc1(:), '.-b');


	title('Flat CBF');
	ylabel('RMSE');
	%ylabel('Slope');
	xlabel('Bias Factor');

	set(gca, 'XLim', [-1 11]);
	%set(gca, 'YLim', [0 20]);

	legend('LR on CBF', 'LR on ASL data', 'Spatially Regularised');


end

