# matlab-image-filtering
# MATLAB Image Filtering Toolkit

A simple and efficient MATLAB function for applying 2D convolution kernels (filters) to grayscale images, with built-in options for common post-processing techniques like contrast stretching and histogram equalization.

This project refactors a traditional, loop-based implementation into a modern, vectorized, and reusable tool suitable for academic and practical image processing tasks.



---

##  Features

-   **Fast & Efficient:** Uses MATLAB's optimized `conv2` function for high-performance convolution, avoiding slow pixel-by-pixel loops.
-   **Modular Design:** The core logic is encapsulated in a reusable `applyImageKernel.m` function, which is called by a clean "driver" script.
-   **Flexible Post-Processing:** Easily apply linear contrast stretching or histogram equalization via a simple string argument.
-   **Comparative Visualization:** The main script generates a single figure showing the original image and all processed versions side-by-side for easy comparison.

---

##  Requirements

-   MATLAB (R2020a or newer recommended)
-   Image Processing Toolbox (for `imadjust`, `histeq`, etc.)

---

##  How to Use

1.  Place both `applyImageKernel.m` and the driver script (e.g., `run_image_filtering.m`) in the same directory or ensure `applyImageKernel.m` is in your MATLAB path.
2.  Open the driver script `run_image_filtering.m`.
3.  In the **Configuration** section, change the image file and the `kernel` matrix to suit your needs.

    ```matlab
    % --- 1. Configuration ---
    originalImage = imread('your_image_here.tif'); % <-- CHANGE THIS

    % Define the convolution kernel you want to apply
    % Example: A simple 3x3 blurring filter
    kernel = ones(3,3) / 9; % <-- CHANGE THIS
    ```

4.  Run the script. A figure will be generated showing the results.

---

##  Function Reference: `applyImageKernel.m`

This is the core function of the toolkit.

**Syntax**

```matlab
outputImage = applyImageKernel(inputImage, kernel, postProcessing)
```

**Inputs**

-   `inputImage`: A 2D numeric matrix representing a grayscale image.
-   `kernel`: A 2D numeric matrix representing the convolution kernel (filter).
-   `postProcessing`: (Optional) A string specifying the post-processing method. Valid options are:
    -   `'none'` (Default): Returns the raw, unscaled output of the convolution.
    -   `'stretch'`: Applies linear contrast stretching to enhance the image.
    -   `'equalize'`: Applies histogram equalization to improve contrast.

**Output**

-   `outputImage`: The processed 2D image matrix.

---


## Acknowledgments

This code is  a project for the ERE 622 course.
