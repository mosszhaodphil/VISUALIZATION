% This function plot discrete sequence data to compare calculated values with true values

function figure_handle = plot_simulation_result_curve(true_value_vector, model_free_value_vector, model_based_value_vector)

	figure;
	% First set limit of x and y axis of plot
	all_value = vertcat(true_value_vector, model_free_value_vector, model_based_value_vector);
	maximum = max(all_value(:));
	minimum = min(all_value(:));

	% Plot discrete sequence data
	stem(model_free_value_vector, true_value_vector, 'LineStyle', 'none', 'Color', 'r'); % model free estimated perfusion
	hold on;
	stem(model_based_value_vector, true_value_vector, 'LineStyle', 'none', 'Color', 'b')% model based estimated perfusion


	hold on;

	% Plot 45 degree line (y = x) as a reference
	plot(minimum : maximum, minimum : maximum, '--');
	
	% Set x and y axis limit and label
	xlim([minimum maximum]);
	ylim([minimum maximum]);
	xlabel('True CBF (ml/100g/min)');
	ylabel('Simulated CBF (ml/100g/min)');


end

