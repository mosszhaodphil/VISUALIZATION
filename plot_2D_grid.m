% Read data to 2D array
% Row: ASL blur
% Column: Structural image blur

% load values from file

file_handle = fopen('data.txt','r');

formatSpec = '%f %f';

size_asl_data = [7 Inf];

asl_data = fscanf(file_handle, formatSpec, size_asl_data);

asl_data = asl_data';

size(asl_data)

%structural_blur_sigma = 0 : 25;

structural_blur_sigma = [0; 2; 5; 10; 15; 20; 25];

asl_blur_sigma = [0; 2; 5; 10; 15; 20; 25];

figure;

surf(asl_blur_sigma, structural_blur_sigma, asl_data);

title('RMSE. True GM CBF 60ml/100g/min');
xlabel('Structural image blurring sigma');
ylabel('ASL data blurring sigma');
zlabel('RMSE');
%zlim([1 3]);
%zlim([10 85]);

fclose(file_handle);
