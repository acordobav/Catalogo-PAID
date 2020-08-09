% Ejemplo de convolucion en 1D
clc; clear;
x = rand(1, 100); m = length(x);
y = rand(1, 100); n = length(y);
z = zeros(1, m + n - 1); % Crear vector donde se almacena la convolucion
% Realizar la convolucion de manera manual
tic
for i = 1:m+n-1
  v_in = max([1 i+1-n]);
  v_fin = min([i m]);
  for j = v_in:v_fin
    z(i) = z(i) + x(j) * y(i - j + 1);
  endfor
endfor
t1 = toc

% Comando de Octave
tic;
zz = conv(x, y);
t2 = toc

norm(z - zz)