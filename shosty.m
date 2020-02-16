rgbImage = imread('shosty.png');
[rows, columns, numberOfColorChannels] = size(rgbImage)
imshow(rgbImage);
drawnow;
% Extract the individual red, green, and blue color channels.
redChannel = double(rgbImage(:, :, 1));
greenChannel = double(rgbImage(:, :, 2));
blueChannel = double(rgbImage(:, :, 3));
minR = min(redChannel(:))
minG = min(greenChannel(:))
minB = min(blueChannel(:))
maxR = max(redChannel(:))
maxG = max(greenChannel(:))
maxB = max(blueChannel(:))
for col = 1 : columns
  for row = 1 : rows
    message = sprintf('For row=%d, col=%d, diff = %.1f in the red, %.1f in the green, and %.1f in the blue',...
      row, col,...
      redChannel(row, col) - minR, ...
      greenChannel(row, col) - minG, ...
      blueChannel(row, col) - minB);
    fprintf('%s\n', message);
  end  
end