% Obtener el negativo de un video
clc; clear;
imagenes = [];

for i = 1:10
  A = imread(['VIDEO_00' num2str(i - 1) '.jpg']);
  imagenes = [imagenes A];
end

for i = 11:62
  A = imread(['VIDEO_0' num2str(i - 1) '.jpg']);
  imagenes = [imagenes A];
end

% for i = 1:61
  % Imagen original
  
  
  
  
% pause(10^-5)
% end

% pause(10^-5)
% Imagen original

% subplot(1, 2, 1);
% imshow(A);
% title('Imagen Original');
