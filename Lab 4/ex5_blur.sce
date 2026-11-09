// Lab 4 - Ex5: image blur with a 15x15 box kernel (2D convolution)
// Run: exec("ex5_blur.sce");  (needs input.jpeg and ipcv_init.sce in the same folder)

clc;
d =get_absolute_file_path("ex5_blur.sce");
chdir(d);
exec("ipcv_init.sce");              // stub help funcs + load IPCV (Flatpak workaround)

// 1. Read and convert: RGB uint8 -> gray -> double (conv2 needs double)
I = imread("input.jpeg");
G = rgb2gray(I);
X = double(G);
mprintf("image: %dx%d, range [%d, %d]\n", size(X,1), size(X,2), min(X), max(X));

// 2. Box kernel, sum = 1 so brightness is preserved
k = 15;
K = ones(k, k) / (k*k);
mprintf("sum(K) = %.6f\n", sum(K));

// 3. 2D convolution, output same size as input (zero padding outside the image)
tic();
Y = conv2(X, K, "same");
mprintf("conv2 %dx%d: %.2f s\n", k, k, toc());

// 4. Border check: corner only sees (k+1)/2 x (k+1)/2 of the kernel, rest is 0
h = (k + 1) / 2;
mprintf("corner Y(1,1) = %.4f | predicted sum(X(1:%d,1:%d))/k^2 = %.4f | X(1,1) = %.1f\n", ..
    Y(1,1), h, h, sum(X(1:h,1:h)) / (k*k), X(1,1));

// 5. Display: back to uint8 for imshow
clf();
subplot(1, 2, 1); imshow(uint8(X));         title("Original (gray)");
subplot(1, 2, 2); imshow(uint8(round(Y)));  title("Box blur 15x15");

// 6. Export for the report
xs2png(gcf(), "compare_blur15.png");
imwrite(uint8(X), "gray_original.png");
imwrite(uint8(round(Y)), "blur_15x15.png");
mprintf("saved: compare_blur15.png, gray_original.png, blur_15x15.png\n");
