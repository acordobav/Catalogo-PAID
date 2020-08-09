clc; clear;

A = imread('boat.jpg');

subplot(1, 2, 1);
imshow(A);
title('Imagen Original');

%---- Transformacion Lineal

%{
% Aclarar la imagen
c = 1; b = 100;
B = c * A + b;
subplot(1, 2, 2);
imshow(B);
title('Imagen Transformada');

% Oscurecer la imagen
c = 1; b = -100;
C = c * A + b;
%}

c = 1;
for b=0:20:200
  A = c * A + b;
  subplot(1, 2, 2);
  imshow(A);
  title(['Imagen Transformada con c=1 y b=' num2str(b)]);
  pause(0.25);

endfor






