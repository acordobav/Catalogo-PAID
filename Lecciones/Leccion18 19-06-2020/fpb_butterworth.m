function H = fpb_butterworth(m,n,d0,o)
  % Funcion para generar un filtro paso bajo butterworth
  % m: numero de filas, double
  % n: numero de columnas, double
  % d0: frecuencia de corte, double
  % o: orden del filtro butterworth, double 
  % H: imagen en formato double con el filtro paso bajo butterworth
  dist = zeros(m, n);
  m1 = floor(m/2); n1 = floor(n/2);
  for i = 1:m
    for j = 1:n
      dist(i, j) = sqrt((i-m1)^2 + (j-n1)^2);
    endfor
  endfor
  H = 1./(1+(d0./dist).^(-2*o));
endfunction
