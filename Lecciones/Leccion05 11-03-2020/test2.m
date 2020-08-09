pkg load video

m = 41;
% Crear el nuevo video
video = VideoWriter('video_salida.mp4'); % Crear el video nuevo (vacio)
for i = 1:m
  disp(i)
  writeVideo(video, uint8(im(:, :, :, i))); % Agregar cada marco del video
endfor

close(video);