clc; clear;
pkg load image
pkg load video

% V es un objeto que contiene informacion del video
V = VideoReader('video_original.mp4'); % Comando para cargar un video
fr = V.NumberOfFrames; % Numero de Marcos
m = V.Height; % Numero de filas de cada marco
n = V.Width; % Numero de columnas de cada marco

% Se desea redimensionar el tamano de cada marco
m = round(m/2); n = round(n/2);

% Matriz donde se van a guardar los nuevos marcos redimensionados
Y = uint8(zeros(m, n, 3, fr));

% Leer el video y guardar cada uno de los marcos en su nuevo tamano
for k = 1:fr
  Z = readFrame(V); % Leer cada uno de los marcos del video
  Y(:, :, 1, k) = imresize(Z(:, :, 1), [m, n]); % Canal rojo
  Y(:, :, 2, k) = imresize(Z(:, :, 2), [m, n]); % Canal verde
  Y(:, :, 3, k) = imresize(Z(:, :, 3), [m, n]); % Canal azul
endfor

% imshow(Y(:, :, :, 114))

% Crear el nuevo video
video = VideoWriter('video_salida.mp4'); % Crear el video nuevo (vacio)
for i = 1:fr
  writeVideo(video, Y(:, :, :, i)); % Agregar cada marco del video
endfor

close(video);