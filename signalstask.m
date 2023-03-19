%PartA
red = [1 0; 1 0.7];
green = [1 0; 0 0.7];
blue = [0 1; 0 0.7];
RGB = cat(3, red, green, blue);
Image_Synthesized=rgb2gray(RGB);
Image_Added = imread('cameraman.tif');
figure;
subplot(2,2,1)
imshow(Image_Added)
title ('camera man')

subplot(2,2,2)
imshow(Image_Synthesized)
title (' image Synthesized ')

subplot(2,2,3)
imhist(Image_Added)
title ('histogram for camera man')

subplot(2,2,4)
imhist(Image_Synthesized)
title ('histogram image Synthesized')
% Part B
Brighten_AImage=Image_Added+100;
Darken_AImage=Image_Added-100;


Brighten_SImage = Image_Synthesized+100;
Darken_SImage = Image_Synthesized-100;

figure;
subplot(4,3,1)
imshow(Brighten_AImage)
title ('Brigtened Image')


subplot(4,3,2)
imshow(Image_Added)
title ('Original Image')


subplot(4,3,3)
imshow(Darken_AImage)
title (' Darkend Image')


subplot(4,3,4)
imhist(Brighten_AImage)
title ('Histogram for Brigtened Image')


subplot(4,3,5)
imhist(Image_Added)
title ('histogram for Orignal Image')


subplot(4,3,6)
imhist(Darken_AImage)
title ('Histogram for Darkend Image')


subplot(4,3,7)
imshow(Brighten_SImage)
title ('Brigtened Image')


subplot(4,3,8)
imshow(Image_Synthesized)
title ('Original Image')


subplot(4,3,9)
imshow(Darken_SImage)
title (' Darkend Image')


subplot(4,3,10)
imhist(Brighten_SImage)
title ('Histogram for Brigtened Image')


subplot(4,3,11)
imhist(Image_Synthesized)
title ('histogram for Orignal Image')


subplot(4,3,12)
imhist(Darken_SImage)
title ('Histogram for Darkend Image')

figure;
subplot(1,3,1);
y = 0:255;
x = 0:255;
plot(x,y)
title('Original Image');
subplot(1,3,2);
y = x + 100;
y(y > 255) = 255;
plot(x, y);
title('Brightened Image');
subplot(1,3,3);
y = x -100;
y(y < 0) = 0;
plot(x, y);
title('Darkened Image');


%%
%part c
figure;
imagecontrast = histeq(Image_Added);
subplot(2,2,1);
imhist(imagecontrast);
title('histogram for Enhanced Image');
subplot(2,2,2);
imhist(Image_Added);
title('histogram for cameraman');
subplot(2,2,3);
imshow(imagecontrast);
title('Enhanced Image');
subplot(2,2,4);
imshow(Image_Added);
title('cameraman');
[counts, bins] = imhist(Image_Added);
pdf = counts / sum(counts);
cdf = cumsum(pdf);
[enh_counts, enh_bins] = imhist(imagecontrast);
enh_pdf = enh_counts / sum(enh_counts);
enh_cdf = cumsum(enh_pdf);
figure;
subplot(1,2,1);
plot(bins, cdf);
title('Transform Function of Original Image');
xlabel('Input Intensity');
ylabel('Output Intensity');
xlim([0 255]);
ylim([0 1]);
grid on;
subplot(1,2,2);
plot(enh_bins, enh_cdf);
title('Transform Function of Enhanced Image');
xlabel('Input Intensity');
ylabel('Output Intensity');
xlim([0 255]);
ylim([0 1]);
grid on;