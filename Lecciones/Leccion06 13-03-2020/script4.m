clc; clear;

% Transformada por partes

A = imread('boat.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen Original');

[m, n, r] = size(A);
B = zeros(m, n, r);

for i = 1:m
  for j = 1:n
    pixel = A(i, j, :);
    if pixel >= 127 
      B(i, j, :) = 255;
    else 
      B(i, j, :) = 0;
    endif
  endfor
endfor  

subplot(1, 2, 2);
imshow(B);
title('Imagen Transformada');

