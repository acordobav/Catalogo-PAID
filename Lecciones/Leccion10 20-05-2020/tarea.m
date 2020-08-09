% Implementacion de la fórmula de convolucion de matrices
clc; clear;
A = [-2 1 2; 1 2 3; 1 1 1];
B = [-4 3 4; 0 0 0];
[m1, n1] = size(A);
[m2, n2] = size(B);
C1 = zeros(m1+m2-1, n1+n2-1);

tic
%--------------------- Inicio Primera sumatoria -------------------%
for j = 1:m1+m2-1
  p_in = max([1 j-m2+1]); % p inicial
  p_fin = min([j m1]); % p final
  
  for p = p_in:p_fin
  %------------------- Inicio Segunda sumatoria -------------------%  
    for k = 1:n1+n2-1
      q_in = max([1, k-n2+1]); % q inicial
      q_fin = min([k n1]); % q final
      
      for q = q_in:q_fin  
        C1(j, k) = C1(j, k) + A(p, q) * B(j-p+1, k-q+1);
      endfor
    endfor  
  %------------------- Final Segunda sumatoria --------------------%
  endfor  
endfor
%--------------------- Final Primera sumatoria --------------------%
t1 = toc

% Metodo de Octave para calcular la convolucion
tic;
C2 = conv2(A, B);
t2 = toc
norma = norm(C1 - C2)
C1
