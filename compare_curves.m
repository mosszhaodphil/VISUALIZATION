% This function plots the time series of different signals on a line chart
% Input parameters:
% simulate_signal: file name of original simulated signal nifty file
% estimate_signal: file name of estimated signal (curve fit) nifty file
% retest_g_signal: file name of simulated file using all estimated parameters nifty file
% retest_f_signal: file name of simulated file using only estimated CBF nifty file

function [] = compare_curves(simulate_signal, estimate_signal, retest_g_signal, retest_f_signal)

	% Load files
	simulate_handle = load_nii(simulate_signal);
	estimate_handle = load_nii(estimate_signal);
	% retest_handle   = load_nii(retest_signal);
	retest_g_handle = load_nii(retest_g_signal);
	retest_f_handle = load_nii(retest_f_signal);

	% Read in 4D signal matrix
	simulate_matrix = simulate_handle.img;
	estimate_matrix = estimate_handle.img;
	% retest_matrix   = retest_handle.img;
	retest_g_matrix = retest_g_handle.img;
	retest_f_matrix = retest_f_handle.img;

	% Read in signal time series
	simulate_vector = simulate_matrix(32, 32, 1, :);
	estimate_vector = estimate_matrix(33, 32, 1, :);
	% retest_vector   = retest_matrix(32, 32, 1, :);
	retest_g_vector   = retest_g_matrix(32, 32, 1, :);
	retest_f_vector   = retest_f_matrix(32, 32, 1, :);

	simulate_vector = simulate_vector(:);
	estimate_vector = estimate_vector(:);
	% retest_vector   = retest_vector(:);
	retest_g_vector = retest_g_vector(:);
	retest_f_vector = retest_f_vector(:);

	% Only first 13 TIs is used. The remainings are repeat
	simulate_vector = simulate_vector(1 : 13);
	estimate_vector = estimate_vector(1 : 13);
	% retest_vector   = retest_vector(1 : 13);
	retest_g_vector = retest_g_vector(1 : 13);
	retest_f_vector = retest_f_vector(1 : 13);

	% Plot figure
	figure;

	% Plot original simulation curve
	plot(simulate_vector, 'Color', 'r');
	hold on;

	% Plot estimated curve
	plot(estimate_vector, 'Color', 'b');
	hold on;

	% plot(retest_vector, 'Color', 'k');
	% hold on;

	% Plot retest signal using all estimated parameters
	plot(retest_g_vector, 'Color', 'k');
	hold on;

	% Plot retest signal using only estimated CBF
	plot(retest_f_vector, 'Color', 'g');
	hold on;

	legend('Simulation', 'Estimation', 'Retest All params', 'Retest CBF ONLY');
	title('CBF = 10'); % The title needs to be changed according to each CBF input value

end
