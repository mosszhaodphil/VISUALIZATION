
% navigate to target directory
cd('./full');

% File names:
file_name_g    = 'mean_g.nii.gz';
file_name_t1_t = 'mean_T_1.nii.gz';
file_name_t1_b = 'mean_T_1b.nii.gz';
file_name_f    = 'mean_ftiss.nii.gz';

% open files
file_handle_g    = load_nii(file_name_g);
file_handle_t1_t = load_nii(file_name_t1_t);
file_handle_t1_b = load_nii(file_name_t1_b);
file_handle_f    = load_nii(file_name_f);

% read parameter values
matrix_g    = file_handle_g.img;
matrix_t1_t = file_handle_t1_t.img;
matrix_t1_b = file_handle_t1_b.img;
matrix_f    = file_handle_f.img;

estimated_g    = matrix_g(33, 32, 1);
estimated_t1_t = matrix_t1_t(33, 32, 1);
estimated_t1_b = matrix_t1_b(33, 32, 1);
estimated_f    = matrix_f(33, 32, 1);

% scale CBF
estimated_f = estimated_f * 6000 / 0.91;

% navigate to current dirctory
cd('..');

% write to text file
file_handle = fopen('_estimated_parameters.txt', 'wt');
fprintf(file_handle, 'f: %.4f\n', estimated_f);
fprintf(file_handle, 'T1t: %.4f\n', estimated_t1_t);
fprintf(file_handle, 'T1b: %.4f\n', estimated_t1_b);
fprintf(file_handle, 'g: %.4f\n', estimated_g);

fclose(file_handle);

