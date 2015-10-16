% This function plots the simulated tissue/blood curve with error bars at each sampling point


function plot_curve_error_bar()

	% Read input data file
	data = csvread('tissue_gm_csv.csv');

	snr = 0.1;
	sd = 1000;

	true_data = data(1, :);
	error_distance = (snr ./ sd) * rand(size(true_data)); % This is used to generate real noisy data
	error_distance = (snr ./ sd) * ones(size(true_data)); % This is used for visualisation

	% Draw curve
	figure;
	plot(true_data);
	hold on;

	% Draw error bar
	%error_curve = errorbar(true_data, error_distance);
	%set(error_curve, 'Marker', 'o', 'MarkerSize', 3);

end
