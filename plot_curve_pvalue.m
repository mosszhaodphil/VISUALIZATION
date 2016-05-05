% This function plot a curve and highlight pvalue conditions (greater or less than 0.05)
% input_data is a matrix as following:
% method 1: slope_1, slope_2, slope_3
% method 1: pvlaue1, pvlaue2, pvlaue3
% method 2: slope_1, slope_2, slope_3
% method 2: pvlaue1, pvlaue2, pvlaue3


function plot_curve_pvalue(input_data_file)

	% load matrix data
	input_data_size = [6 8];

	file_extension = '.txt';
	formatSpec = '%f'; % read data in floating point format
	file_handle = fopen(strcat(input_data_file, file_extension), 'r');
	input_data_trans = fscanf(file_handle, formatSpec, input_data_size);
	input_data = input_data_trans' % Transpose the input data


	% Now input_data contains the data matrix
	size(input_data)

	xmin = 0;
	xmax = 7;
	ymin = -0.1;
	ymax = 0.15;
	x = 0 : 1 : 7;

	% Start plotting
	figure;

	plot(input_data(1, :), 'r');
	text(6, input_data(1, 6), '**');
	hold on;
	plot(input_data(3, :), 'b');
	text(1, input_data(3, 1), '**');
	text(5, input_data(3, 5), '**');
	hold on;
	%plot(input_data(7, :), 'k');
	hold on;

	axis([xmin xmax ymin ymax]); % set x and y axis limit

	fclose(file_handle);

end

