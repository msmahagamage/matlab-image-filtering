function outputImage = applyImageKernel(inputImage, kernel, postProcessing)
%applyImageKernel Applies a convolution kernel to an image with optional post-processing.
%
%   SYNTAX:
%   output = applyImageKernel(inputImage, kernel, postProcessing)
%
%   INPUTS:
%   inputImage          - A 2D numeric matrix representing a grayscale image.
%   kernel              - A 2D numeric matrix representing the convolution kernel (filter).
%   postProcessing      - A string specifying the post-processing method.
%                         Valid options are:
%                         'none'      - Raw convolution output.
%                         'stretch'   - Apply linear contrast stretching.
%                         'equalize'  - Apply histogram equalization.
%
%   OUTPUT:
%   outputImage         - The processed 2D image matrix.

% --- 1. Input Validation ---
if nargin < 3
    postProcessing = 'none'; % Default to no post-processing
end
validateattributes(inputImage, {'numeric'}, {'2d'}, mfilename, 'inputImage');
validateattributes(kernel, {'numeric'}, {'2d'}, mfilename, 'kernel');
validStrings = {'none', 'stretch', 'equalize'};
if ~ismember(lower(postProcessing), validStrings)
    error('Invalid postProcessing method. Choose from: ''none'', ''stretch'', or ''equalize''.');
end

% --- 2. Core Convolution (Vectorized) ---
% Convert to double for accurate mathematical operations
imageDouble = im2double(inputImage);

% Use MATLAB's built-in, optimized 2D convolution function.
% The 'same' flag ensures the output is the same size as the input
% and handles borders correctly.
convolvedImage = conv2(imageDouble, kernel, 'same');

% --- 3. Post-Processing ---
switch lower(postProcessing)
    case 'none'
        outputImage = convolvedImage;
        
    case 'stretch'
        % imadjust performs linear contrast stretching on the [0, 1] range.
        outputImage = imadjust(convolvedImage);
        
    case 'equalize'
        % histeq works best on integer types. We first scale the convolved
        % image to the full 8-bit range [0, 255].
        scaledImage = uint8(255 * mat2gray(convolvedImage));
        outputImage = histeq(scaledImage);
end

end