clc; clear

% Cargar la imagen
X = imread('lena.jpg');

% Mostrar imagen
% imshow(X);

% Tamaño de la imagen
[m, n, r] = size(X);

% Informacion de la imagen
% imfinfo("lena.jpg")

% Mostrar las primeras cinco filas y columnas del canal rojo
R5 = X(1:5, 1:5, 1);
% Canales(R, G, B)

% Convertir de formato imagen a double
R5_2 = im2double(R5);

% Guardar los canales en matrices aparte
R = X(:, :, 1); % Canal rojo
G = X(:, :, 2); % Canal verde
B = X(:, :, 3); % Canal azul

% imshow(R)

% Guardar imagen con solo el canal rojo habilitado
Y = zeros(m, n, 3);
Y(: , :, 1) = R; % Guardar la informacion del canal rojo
Y = uint8(Y); % Se convierte a un formato de 8 bits

% imshow(Y)


% Guardar la imagen
% imwrite(Y, "canal_rojo.jpg", "quality", 100);

% Descomposicion en Valores Singulares
A = rand(4, 6);
% [U, S, V] = svd(A) % Donde A = U * V * S'


% Comprimir el canal rojo usando la SVD
R = im2double(R);
[U, S, V] = svd(R);
k = 100;
Uk = U(:, 1:k); Sk = S(1:k, 1:k); Vk = V(:, 1:k);
R_k = Uk * Sk * Vk';
imshow(R_k)
