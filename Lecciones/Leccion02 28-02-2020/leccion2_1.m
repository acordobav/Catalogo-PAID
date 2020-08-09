clc; clear;

% Trabajar con imagenes .jpg
A = imread('cameraman.jpg');

% Se cambia el formato a double
A = im2double(A);
[m, n] = size(A);
r = min([m, n]);

[U, S, V] = svd(A);
dimensiones = [1 20:20:460 r]; % Limite inferior, inicia en 20, salta de 20 en 20,
%hasta 460, limite derecho.

for k = dimensiones
  Uk = U(:, 1:k); Sk = S(1:k, 1:k); Vk = V(:, 1:k);
  A_k = Uk * Sk * Vk';
  error = norm(A - A_k);
  subplot(1, 2, 1); % Se divide la grafica en una fila y en dos columnas
  imshow(A);
  title('Imagen Original')

  subplot(1, 2, 2);
  imshow(A_k);
  title(['Imagen Reconstruida con k = ' num2str(k) ' con error de ' num2str(error)])
  pause(0.5)
end



