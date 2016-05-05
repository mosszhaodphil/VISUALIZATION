% source
% http://stackoverflow.com/questions/29155899/matlab-multipleparallel-box-plots-in-single-figure

function plot_box_chart_random_pve_error_exp(file_1)

	% Read in the data from the input text file
	data_matrix = dlmread(file_1);
	[num_exp, num_charts] = size(data_matrix);

	data_matrix(data_matrix == 0) = NaN;
	
	%{
	sd_5_lr_on_cbf   = data_matrix(:, 1);
	sd_5_lr_on_data  = data_matrix(:, 2);
	sd_5_no          = data_matrix(:, 3);
	sd_5_spatial     = data_matrix(:, 4);
	
	sd_10_lr_on_cbf  = data_matrix(:, 5);
	sd_10_lr_on_data = data_matrix(:, 6);
	sd_10_no         = data_matrix(:, 7);
	sd_10_spatial    = data_matrix(:, 8);
	
	sd_15_lr_on_cbf  = data_matrix(:, 9);
	sd_15_lr_on_data = data_matrix(:, 10);
	sd_15_no         = data_matrix(:, 11);
	sd_15_spatial    = data_matrix(:, 12);
	
	sd_20_lr_on_cbf  = data_matrix(:, 13);
	sd_20_lr_on_data = data_matrix(:, 14);
	sd_20_no         = data_matrix(:, 15);
	sd_20_spatial    = data_matrix(:, 16);
	
	sd_25_lr_on_cbf  = data_matrix(:, 17);
	sd_25_lr_on_data = data_matrix(:, 18);
	sd_25_no         = data_matrix(:, 19);
	sd_25_spatial    = data_matrix(:, 20);

	sd_30_lr_on_cbf  = data_matrix(:, 21);
	sd_30_lr_on_data = data_matrix(:, 22);
	sd_30_no         = data_matrix(:, 23);
	%sd_30_spatial    = data_matrix(:, 24);
	%}


	c = [1 0 0; 0 0.5 0; 0 0 1]
	C = [c; ones(1, 3); c; ones(1, 3); c; ones(1, 3); c; ones(1, 3); c; ones(1, 3); c; ones(1, 3)]  % this is the trick for coloring the boxes

	%{
	figure;
	boxplot([sd_5_lr_on_cbf  sd_5_lr_on_data  sd_5_spatial ... 
		     sd_10_lr_on_cbf sd_10_lr_on_data sd_10_spatial ... 
		     sd_15_lr_on_cbf sd_15_lr_on_data sd_15_spatial ... 
		     sd_20_lr_on_cbf sd_20_lr_on_data sd_20_spatial ...
		     sd_25_lr_on_cbf sd_25_lr_on_data sd_25_spatial ]);
	%}

	figure;
	boxplot(data_matrix, 'colors', C, 'labels', {'','5','','','','10','','','','15','','','','20','','','','25','','','','30','', ''});


	%h = findobj(gca, 'tag', 'Outliers');
	%delete(h);   

	title('Flat CBF');
	ylabel('RMSE');
	xlabel('Standard Deviation');


end

