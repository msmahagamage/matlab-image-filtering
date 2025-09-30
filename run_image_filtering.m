% =========================================================================
% run_image_filtering.m
%
% This script loads an image, defines a convolution kernel, and uses the
% applyImageKernel function to generate and display filtered images with
% different post-processing techniques.
% =========================================================================
clear; clc; close all;

% --- 1. Configuration ---
try
    originalImage = imread('campus_small.tif');
catch
    error('Could not find image file: campus_small.tif. Make sure it is in the path.');
end

% Define the convolution kernel (e.g., a horizontal edge detector)
kernel = [-1 -1 -1; 2 2 2; -1 -1 -1];
% kernel = ones(3,3) / 9; % Example of a simple blurring filter

% --- 2. Execution ---
fprintf('Applying kernel and post-processing...\n');
tic;
% Call the new function for each processing type
rawOutput = applyImageKernel(originalImage, kernel, 'none');
stretchedOutput = applyImageKernel(originalImage, kernel, 'stretch');
equalizedOutput = applyImageKernel(originalImage, kernel, 'equalize');
toc;

% --- 3. Visualization ---
fprintf('Displaying results...\n');
figure('Name', 'Image Convolution Results', 'Position', [100, 100, 1600, 400]);

subplot(1, 4, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 4, 2);
imshow(rawOutput, []); % Use [] to scale the display range for raw output
title('Raw Convolution');

subplot(1, 4, 3);
imshow(stretchedOutput);
title('With Linear Stretching');

subplot(1, 4, 4);
imshow(equalizedOutput);
title('With Histogram Equalization');