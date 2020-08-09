function Z = rand_e(m,n,alpha)
  % Genera una matriz pseudoaleatoria de dimensiones mxn que
  % sigue una funcion de densidad exponencial con parametro alpha
  U = rand(m,n);
  Z = (-1/alpha)*log(1-U);
endfunction
