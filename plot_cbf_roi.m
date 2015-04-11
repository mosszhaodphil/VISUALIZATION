% This function plots the ROI curve of four mean perfusion
% Input:
% Four mean perfusion value text files
% Output:
% Plot

function image_handle = plot_cbf_roi(file_1, file_2, file_3, file_4)

	file_extension = '.txt';
	formatSpec = '%f'; % read data in floating point format

	legend_1 = 'Asllani T1';
	legend_2 = 'Asllani Up/down sample';
	legend_3 = 'Fabber T1';
	legend_4 = 'Fabber Up/down sample';

	% load data from text file
	file_handle_1 = fopen(strcat(file_1, file_extension), 'r');
	file_handle_2 = fopen(strcat(file_2, file_extension), 'r');
	file_handle_3 = fopen(strcat(file_3, file_extension), 'r');
	file_handle_4 = fopen(strcat(file_4, file_extension), 'r');
	cbf_roi_1 = fscanf(file_handle_1,formatSpec);
	cbf_roi_2 = fscanf(file_handle_2,formatSpec);
	cbf_roi_3 = fscanf(file_handle_3,formatSpec);
	cbf_roi_4 = fscanf(file_handle_4, formatSpec);

	% find limit of x and y axis
	data = [cbf_roi_1; cbf_roi_2; cbf_roi_3; cbf_roi_4];
	xmin = 10;
	xmax = 100;
	ymin = min(data(:)) - 10;
	ymax = max(data(:)) + 10;

	% ymin = 1.1047 - 0.3; % 1.1047 is the minimum of all ratios
	% ymax = 5.3268 + 0.3; % 5.3268 is the maximum of all ratios

	%ymin = 34.044 - 10; % 34.044 is the minimum of all GM perfusion
	%ymax = 239.03 + 10; % 239.03 is the minimum of all GM perfusion

	% x axis
	x = 15 : 10 : 95;

	% start plotting
	figure;

	line_1 = plot(x, cbf_roi_1, '-b*');
	hold on;
	line_2 = plot(x, cbf_roi_2, '-ro');
	hold on;
	line_3 = plot(x, cbf_roi_3, '-gs');
	hold on;
	line_4 = plot(x, cbf_roi_4, '-k^');

	axis([xmin xmax ymin ymax]); % set x and y axis limit

	set([line_1 line_2 line_3 line_4], 'LineWidth', 1); % Set line thickness

	% Set x and y axis label
	xlabel('GM PVE %');
	ylabel('Mean CBF');

	% Plot legent and title
	legend(legend_1, legend_2, legend_3, legend_4);
	title('Dataset 6');

	fclose all;

end

