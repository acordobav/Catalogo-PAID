function T = otsu(A)
  % Funcion que calcula el umbral utilizando el metodo de Otsu
  % A: imagen original en formato uint8
  % T: umbral para la imagen A
  [m,n] = size(A);
  % Paso 0: Calcular el histograma de la imagen A
  [q,~] = imhist(A);

  % Paso 1: Calcular el histograma normalizado
  h = (1/(m*n))*q;

  % Paso 2: Calcular vector de suma acumulada
  p = zeros(256,1);
  for k = 1:256
    p(k) = sum(h(1:k));
  endfor

  % Paso 3: Calcular vector de suma acumulada con peso
  mc = zeros(256,1);
  for k = 1:256
    mc(k) = sum((0:k-1)'.*h(1:k));  
  endfor

  % Paso 4: Calcular el maximo de mc
  mg = mc(256);

  % Paso 5: Calcular vector de varianza entre clases
  N = (mg*p-mc).^2;
  D = p.*(1-p);
  delta2b = N./D;

  % Paso 6: Posicion maxima del vector delta2b
  [~,T] = max(delta2b);
  T = T-1; % Ya que Octave cuenta a partir del 1 y no del 0  
endfunction
