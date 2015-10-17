% This function plots the ROI curve of four mean perfusion
% Input:
% Four mean perfusion value text files
% Output:
% Plot

function image_handle = plot_cbf_roi(file_1, file_2, file_3, file_4)

	file_extension = '.txt';
	formatSpec = '%f'; % read data in floating point format

	legend_1 = 'LR on CBF map';
	legend_2 = 'LR on ASL data';
	legend_3 = 'Spatially Regularised';
	legend_4 = 'No PV correction';

	% load data from text file
	file_handle_1 = fopen(strcat(file_1, file_extension), 'r');
	file_handle_2 = fopen(strcat(file_2, file_extension), 'r');
	file_handle_3 = fopen(strcat(file_3, file_extension), 'r');
	file_handle_4 = fopen(strcat(file_4, file_extension), 'r');
	cbf_roi_1 = fscanf(file_handle_1, formatSpec);
	cbf_roi_2 = fscanf(file_handle_2, formatSpec);
	cbf_roi_3 = fscanf(file_handle_3, formatSpec);
	cbf_roi_4 = fscanf(file_handle_4, formatSpec);

	% find limit of x and y axis
	data = [cbf_roi_1; cbf_roi_2; cbf_roi_3; cbf_roi_4];
	xmin = 10;
	xmax = 100;
	ymin = 15;
	ymax = 75;
	%ymin = min(data(:)) - 10;
	%ymax = max(data(:)) + 10;

	% ymin = 1.1047 - 0.3; % 1.1047 is the minimum of all ratios
	% ymax = 5.3268 + 0.3; % 5.3268 is the maximum of all ratios

	%ymin = 34.044 - 10; % 34.044 is the minimum of all GM perfusion
	%ymax = 239.03 + 10; % 239.03 is the minimum of all GM perfusion

	% x axis
	x = 15 : 10 : 95;

	% start plotting
	figure;

	line_1 = plot(x, cbf_roi_1, '-r.');
	hold on;
	line_2 = plot(x, cbf_roi_2, '-g.');
	hold on;
	line_3 = plot(x, cbf_roi_3, '-b.');
	hold on;
	line_4 = plot(x, cbf_roi_4, '-k.');
	hold on;

	axis([xmin xmax ymin ymax]); % set x and y axis limit

	%set([line_1 line_2], 'LineWidth', 1); % Set line thickness

	% Set x and y axis label
	xlabel('GM PVE (%)');
	ylabel('Mean GM CBF (ml/100g/min)');

	% Plot legent and title
	legend(legend_1, legend_2, legend_3, legend_4);
	title('Noise free');

	%x0 = 0; y0 = 0; width = 600; height = 600;
	%set(gcf,'units','points','position',[x0,y0,width,height]);


	% Draw dash line to indicate true value in simulation
	true_cbf = 60;
	ref_y = true_cbf * ones(10);
	ref_x = 10 : 10 : 100;

	%line_4 = plot(ref_x, ref_y, '--m');
	hold on;

	fclose all;

end

