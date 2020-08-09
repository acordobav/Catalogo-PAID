clc; clear;

A = imread('barbara.jpg');

B = rotar_con_esquinas(A, 75);

% B = promedio(A);

% imwrite(B, 'test_esquinas_promedio.jpg', 'quality', 100);

imshow(B);