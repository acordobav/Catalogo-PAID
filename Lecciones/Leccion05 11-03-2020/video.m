clc; clear;
pkg load image;
pkg load video;

A = imread('barbara.jpg');

A = imresize(A, [75, 75]);

z = [1 5:5: 195 200];

[m, n, r] = size(A);

im = zeros(m, n, r, size(z)(2));

% Se crean las imagenes con el efecto
elemento = 1;
for k = z
  B = rippling(A, k, k, 75, 75);
  B = promedio(B);
  im(:, :, :, elemento) = B;
  elemento = elemento + 1;
end

m = size(im)(4);

videoObj = VideoWriter('videoObj.mp4'); % Crea el objeto del video
open(videoObj); % Abre el archivo para escribir
for i = 1:m
  imagen = im(:, :, :, i);
  imagen = uint8(imagen);
  writeVideo(videoObj, imagen); % Escribe la imagen en el archivo
endfor

close(videoObj);
