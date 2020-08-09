clc; clear;

% Transformada exponencial

A = imread('boat.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen Original');

c = 1;

for a = 0.1:0.1:2
  B = c * power(A, a); 
  subplot(1, 2, 2);
  imshow(B);
  title(['T. Exp. a = ' num2str(a)]);
  pause(0.25);
endfor

