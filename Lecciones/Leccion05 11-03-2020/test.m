clc; clear;
pkg load image

A = imread('barbara.jpg');

A = imresize(A, [100, 100]);

z = [1 5:5: 195 200];

[m, n, r] = size(A);

im = zeros(m, n, r, size(z)(2));

elemento = 1;
for k = z
  B = rippling(A, k, k, 75, 75);
  B = promedio(B);
  im(:, :, :, elemento) = B;
  elemento = elemento + 1;
end

%{
m = size(im);
for i = 1:m
  subplot(1, 2, 1);
  imshow(A);
  title('Imagen Original');

  B = im(:, :, :, i);
  subplot(1, 2, 2);
  imshow(B);
  title(['Rippling']);

  pause(0.5);
end  }%