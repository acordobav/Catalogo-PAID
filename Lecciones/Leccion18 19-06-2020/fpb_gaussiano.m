function H = fpb_gaussiano(m,n,s)
  % Funcion para generar un filtro paso bajo gaussiano
  % m: numero de filas, double
  % n: numero de columnas, double
  % s: parametro de corte, debe ser un double > 0
  % H: imagen en formato double con el filtro paso bajo gaussiano
  dist = zeros(m,n);
  m1 = floor(m/2); n1 = floor(n/2);
  for i = 1:m
    for j = 1:n
      dist(i,j) = sqrt((i-m1)^2 + (j-n1)^2);
    endfor
  endfor
  H = exp(-(dist.^2)/(2*s^2));
endfunction
