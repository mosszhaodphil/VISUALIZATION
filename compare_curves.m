

function [] = compare_curves(simulate_signal, estimate_signal, retest_g_signal, retest_f_signal)

	simulate_handle = load_nii(simulate_signal);
	estimate_handle = load_nii(estimate_signal);
	% retest_handle   = load_nii(retest_signal);
	retest_g_handle = load_nii(retest_g_signal);
	retest_f_handle = load_nii(retest_f_signal);

	simulate_matrix = simulate_handle.img;
	estimate_matrix = estimate_handle.img;
	% retest_matrix   = retest_handle.img;
	retest_g_matrix = retest_g_handle.img;
	retest_f_matrix = retest_f_handle.img;


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

	simulate_vector = simulate_vector(1 : 13);
	estimate_vector = estimate_vector(1 : 13);
	% retest_vector   = retest_vector(1 : 13);
	retest_g_vector = retest_g_vector(1 : 13);
	retest_f_vector = retest_f_vector(1 : 13);

	figure;

	plot(simulate_vector, 'Color', 'r');

	hold on;

	plot(estimate_vector, 'Color', 'b');

	hold on;

	% plot(retest_vector, 'Color', 'k');

	hold on;

	plot(retest_g_vector, 'Color', 'k');

	hold on;

	plot(retest_f_vector, 'Color', 'g');

	hold on;

	legend('Simulation', 'Estimation', 'Retest All params', 'Retest CBF ONLY');
	title('CBF = 10');

end
