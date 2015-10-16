

function plot_scatter_curve_fit()

	% Read input data file
	data = csvread('tissue_pv_csv.csv');

	data_true = data(1, :);
	data_noise = data(2 : end, :);

	x = zeros(130, 1);
	y = zeros(130, 1);

	count = 1;
	for i = 1 : 10
		for j = 1 : 13
			y(count, 1) = data_noise(i, j);
			x(count, 1) = j;
			count = count + 1;
		end
	end


	figure;
	scatter(x(:), y(:));
	hold on;
	plot(data_true(:));

end
