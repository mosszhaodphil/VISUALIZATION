function plot_histogram(file_1, file_2, file_3, file_4)

	handle_1 = load_nii(strcat(file_1, '.nii.gz'));
	handle_2 = load_nii(strcat(file_2, '.nii.gz'));
	handle_3 = load_nii(strcat(file_3, '.nii.gz'));
	handle_4 = load_nii(strcat(file_4, '.nii.gz'));

	data_1 = handle_1.img;
	data_2 = handle_2.img;
	data_3 = handle_3.img;
	data_4 = handle_4.img;

	data_1 = sort(nonzeros(data_1));
	data_2 = sort(nonzeros(data_2));
	data_3 = sort(nonzeros(data_3));
	data_4 = sort(nonzeros(data_4));

	data = [data_1; data_2; data_3; data_4];

	my_range = min(data) : 1 : max(data);

	%range_1= min(data_1) : 10 : max(data_1);
	%range_2= min(data_2) : 10 : max(data_2);

	[data_1_counts] = histc(data_1, my_range);
	[data_2_counts] = histc(data_2, my_range);
	[data_3_counts] = histc(data_3, my_range);
	[data_4_counts] = histc(data_4, my_range);

	figure;
	h1 = bar(my_range, data_1_counts, 'histc');
	set(h1,'FaceColor',[1,0,0]);

	hold on;
	h2 = bar(my_range, data_2_counts, 'histc');
	set(h2,'FaceColor',[0,1,0]);

	hold on;
	h3 = bar(my_range, data_3_counts * -1, 'histc');
	set(h3,'FaceColor',[0,0,1]);

	hold on;
	h4 = bar(my_range, data_4_counts * -1, 'histc');
	set(h4,'FaceColor','k');

	%legend('LR on CBF', 'LR on data', 'Spatial');

end

