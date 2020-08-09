clc; clear; close all;
pkg load image;
A = imread('linea1.jpg');
% Convertir en binaria (0=negro, 1=blanco)
B = im2double(A);
B(B<0.5) = 0; B(B>=0.5) = 1; % Se obtiene una imagen binaria

%figure
%imshow(B);

% Calcular la discretizacion de theta y rho
% 1. Theta: Toma valores en el intervalo [0,180]
h1 = 1;
thetas = deg2rad(0:h1:180);
% 2. Rho: Toma valroes en [-d,d], donde d = sqrt(m^2+n^2)
%         donde mxn es el tamaño de la imagen
[m,n] = size(A);
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

figure
hold on 
imshow(im2uint8(B));

% Encontrar la maxima posicion del Acumulador
[xp,yp] = find(Acumulador==max(max(Acumulador)))
% Observacion: Si el maximo se repite mas de una vez, entonces
% 'x' y 'y' son vectores que tienen las posiciones

% Graficar
thetaMax = thetas(xp(1));
rhoMax = rhos(yp(1));

% Calcular pendiente
pendiente = -cos(thetaMax)/sin(thetaMax);
interseccion = rhoMax/sin(thetaMax)

% Necesitamos el punto (1,y1)
y1 = pendiente*1 + interseccion;

% Necesitamos el punto (xn,n)
xn = (n-interseccion)/pendiente;

% Para graficar la linea, usamos el comando line
line([y1 n],[1 xn],'LineWidth',2);
