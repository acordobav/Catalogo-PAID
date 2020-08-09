clc; clear;
pkg load image
pkg load video

#{
Y = zeros(256, 256, 62);
for i = 0:61
  if i < 10
    t = ['img_video\VIDEO_00' num2str(i) '.jpg'];
  else
    t = ['img_video\VIDEO_0' num2str(i) '.jpg'];
  end
  
  X = imread(t);
  X = imresize(X, [256, 256]);
  Y(:, :, i + 1) = X(:, :, 1);
endfor

video = VideoWriter('yourvideo.avi'); % Creacion del archivo
open(video); % Se abre el video para escribir

for i = 1:62
  writeVideo(video, Y(:, :, i)); % Se escribe la imagen en el archivo
end

close(video);
#}


