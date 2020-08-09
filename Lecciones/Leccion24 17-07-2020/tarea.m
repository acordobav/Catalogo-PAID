clc; clear; close all;
pkg load image;
A = imread('cuadro.jpg');
B = imread('bordes-cuadro.jpg');

A = im2double(A); B = im2double(B);

% Obtener los bordes de la imagen A
% 1. Mascaras para la convolucion (Sobel)
Bx = [-1 0 1; -2 0 2; -1 0 1];
By = [-1 -2 -1; 0 0 0; 1 2 1];      
% 2. Convolucion
A = im2double(A);
[m,n] = size(A);
Cx = conv2(A,Bx);
Cx = Cx(2:m+1,2:n+1);
Cy = conv2(A,By);
Cy = Cy(2:m+1,2:n+1);
C = sqrt(Cx.^2+Cy.^2);

% Convertir en binaria (0=negro, 1=blanco)
C(C<0.5) = 0; C(C>=0.5) = 1; % Se obtiene una imagen binaria

D = B(:,:,1)>0.1 & B(:,:,2)>0.1 & B(:,:,3)>0.1;
D = im2double(D);

E = C & D;

E = cat(3,E,E,E);
R = cat(3,ones(m,n),zeros(m,n),zeros(m,n)); % Imagen roja

M = cat(3,A,A,A);
M(E) = R(E);
imshow(M);