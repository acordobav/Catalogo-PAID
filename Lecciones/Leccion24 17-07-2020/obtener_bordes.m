clc; clear; close all;
pkg load image;
A = imread('cuadro.jpg');
A = imresize(A,floor(size(A)/2)); % Reducir el tamaño de la imagen en un 50%
figure
imshow(A);
title('Imagen original')

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

figure;
imshow(C);
title('Bordes con Sobel');
B = C;

% Calcular la discretizacion de theta y rho
% 1. Theta: Toma valores en el intervalo [0,180]
h1 = 1;
thetas = deg2rad(0:h1:180);
% 2. Rho: Toma valroes en [-d,d], donde d = sqrt(m^2+n^2)
%         donde mxn es el tamaño de la imagen
d = sqrt(m^2+n^2);
h2 = 1;
rhos = -d:h2:d;

% Crear matriz acumulador
Acumulador = zeros(length(thetas),length(rhos));

for x = 1:m
  for y = 1:n
    if B(x,y)==1
      for theta_ind = 1:length(thetas)
        theta = thetas(theta_ind);
        rho = x*cos(theta)+y*sin(theta);
        [~,rho_ind] = min(abs(rhos-rho));
        Acumulador(theta_ind,rho_ind)+=1;
      endfor      
    endif
  endfor
endfor  

%figure
%surface(thetas,rhos,Acumulador','EdgeColor','none');
%xlabel('Theta');
%ylabel('Rho');

Z = imread('negro.jpg');
Z = imresize(Z,floor(size(Z)/2)); % Reducir el tamaño de la imagen en un 50%
figure
hold on 
imshow(Z);

lineas_intentos = 25;

for r = 1:lineas_intentos
  % Encontrar la maxima posicion del Acumulador
  [xp,yp] = find(Acumulador==max(max(Acumulador)));
  % Observacion: Si el maximo se repite mas de una vez, entonces
  % 'x' y 'y' son vectores que tienen las posiciones

  % Graficar
  for k = 1:length(xp)

    thetaMax = thetas(xp(k));
    rhoMax = rhos(yp(k));

    if abs(sin(thetaMax)) < 10^-4
      x_v = rhoMax/cos(thetaMax);
      line([n 1], [x_v x_v], 'LineWidth', 2);
    else
      % Calcular pendiente
      pendiente = -cos(thetaMax)/sin(thetaMax);
      interseccion = rhoMax/sin(thetaMax);
      % Necesitamos el punto (1,y1)
      y1 = pendiente*1 + interseccion;
      % Necesitamos el punto (m,y1)
      ym = pendiente*m + interseccion;
      % Necesitamos el punto (xn,1)
      x1 = (1-interseccion)/pendiente;
      % Necesitamos el punto (xn,n)
      xn = (n-interseccion)/pendiente;

      if pendiente > 0
        if 0 < y1
          % Para graficar la linea, usamos el comando line
          line([y1 n],[1 xn],'LineWidth',2);    
        else
          % Para graficar la linea, usamos el comando line
          line([1 ym],[x1 m],'LineWidth',2);
        end
      else
        if y1 > m
          % Para graficar la linea, usamos el comando line
          line([ym n],[m xn],'LineWidth',2);    
        else
          % Para graficar la linea, usamos el comando line
          line([y1 1],[1 x1],'LineWidth',2);
        end
      end
    end
    Acumulador(xp(k),yp(k)) = 0;
  endfor
endfor  