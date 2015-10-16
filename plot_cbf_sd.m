% This function plots the ROI curve of four mean perfusion
% Input:
% Four mean perfusion value text files
% Output:
% Plot

function image_handle = plot_cbf_sd(file_1, file_2, file_3, file_4, file_5, file_6)

	file_extension = '.txt';
	formatSpec = '%f'; % read data in floating point format

	legend_1 = 'Spatially Regularised';
	legend_2 = 'LR on CBF map';
	legend_3 = 'LR on ASL data';
	%legend_4 = 'Fabber Up/down sample';

	% load data from text file
	file_handle_1 = fopen(strcat(file_1, file_extension), 'r');
	file_handle_2 = fopen(strcat(file_2, file_extension), 'r');
	file_handle_3 = fopen(strcat(file_3, file_extension), 'r');
	%file_handle_4 = fopen(strcat(file_4, file_extension), 'r');
	data_1 = fscanf(file_handle_1,formatSpec);
	data_2 = fscanf(file_handle_2,formatSpec);
	data_3 = fscanf(file_handle_3,formatSpec);
	%cbf_roi_1 = fscanf(file_handle_3, formatSpec);
	%cbf_roi_2 = fscanf(file_handle_4, formatSpec);
	%cbf_roi_3 = fscanf(file_handle_4, formatSpec);

	% find limit of x and y axis
	data = [data_1; data_2; data_3];
	xmin = -5;
	xmax = 30;
	ymin = 0;
	ymax = 12;
	%ymin = min(data(:)) - 10;
	%ymax = max(data(:)) + 10;

	% ymin = 1.1047 - 0.3; % 1.1047 is the minimum of all ratios
	% ymax = 5.3268 + 0.3; % 5.3268 is the maximum of all ratios

	%ymin = 34.044 - 10; % 34.044 is the minimum of all GM perfusion
	%ymax = 239.03 + 10; % 239.03 is the minimum of all GM perfusion

	% x axis
	% x = 15 : 10 : 95;
	x = 0 : 5 : 25;

	% start plotting
	figure;

	line_1 = plot(x, data_1, '-b.');
	hold on;
	line_2 = plot(x, data_2, '-r.');
	hold on;
	line_3 = plot(x, data_3, '-g.');
	hold on;
	%hold on;
	%line_4 = plot(x, cbf_roi_4, '-k^');

	axis([xmin xmax ymin ymax]); % set x and y axis limit

	%set([line_1 line_2], 'LineWidth', 1); % Set line thickness

	% Set x and y axis label
	xlabel('Signal-to-noise ratio (SNR)');
	ylabel('Standard Deviation (SD)');

	% Plot legent and title
	%legend(legend_1, legend_2);
	%title('No Noise');

	%x0 = 0; y0 = 0; width = 600; height = 600;
	%set(gcf,'units','points','position',[x0,y0,width,height]);

	fclose all;

end

