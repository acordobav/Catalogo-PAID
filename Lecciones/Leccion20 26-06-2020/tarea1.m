clc; clear; close all;
pkg load image;
A = imread('imagen9.jpg');
A = im2double(A);
A = binaria(A);
subplot(1,2,1);
imshow(A);
title('Imagen original');


[m,n] = size(A);
B = [0 1 0; 1 1 1; 0 1 0];
Xk = A;
k=1;
Sk_aux = A&~imopen(A,B);
while 1
  Xk = imerode(Xk,B);
  Yk = imopen(Xk,B);
  Sk = Xk&~Yk;  
  
  if Xk == 0
    break;
  endif  
  
  Sk_aux = Sk_aux|Sk;
  k+=1;
endwhile

Y = Sk_aux;
subplot(1,2,2);
imshow(Y);
title('Esqueleto')