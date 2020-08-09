clc; clear;

pkg load image

A = imread('peppers.jpg');

subplot(2,2,1);
imshow(A);

% Computing the histogram.
h2 = zeros(256,1); #h2 = [h(0) h(1) h(2) ... h(255)]
for i = 0:255
  h2(i+1) = sum(sum(A==i));
endfor

subplot(2,2,3);
bar(0:255,h2);
title("Histograma");
xlim([0 255]);

% Modify the image streching-in the histogram.
r_min = min(min(A))
r_max = max(max(A))

s_min = 30;
s_max = 150;

A = ((s_max-s_min)/(r_max-r_min))*(A-r_min)+s_min;

subplot(2,2,2)
imshow(A)

A = im2uint8(A);
for i = 0:255
  h2(i+1) = sum(sum(A==i));
endfor
subplot(2,2,4);
bar(0:255,h2);
title("Histograma");
xlim([0 255]);
