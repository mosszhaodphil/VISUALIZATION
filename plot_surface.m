


function plot_surface(data_file_name)

	%formatSpec = '%f'; % read data in floating point format

	%file_handle = fopen(data_file_name, 'r');

	%data_matrix = fscanf(file_handle, formatSpec);

	data_matrix = importdata(data_file_name)

	xmin = 1;
	xmax = 7;
	ymin = 1;
	ymax = 7;

	zmin = 0;
	zmax = 90;

	figure;

	surf(abs(data_matrix));

	%axis([xmin xmax ymin ymax zmin zmax]); % set x and y axis limit

	xlabel('Blurring on structural images');
	ylabel('Blurring on ASL images')
	zlabel('Slope');



	%fclose(file_handle);

end
