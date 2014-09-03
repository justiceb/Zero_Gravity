clc; clear; close all;

vidfile = 'Video/3clip3.wmv';
[workingdir,NAME,EXT] = fileparts(vidfile);
addpath(workingdir);

sortedImageNames = load_image_dir(fullfile(workingdir,NAME,'cropped'));
img = imread(sortedImageNames{84});
figure(1); imshow(img);
img_bw = im2bw(img, 0.39);
figure(2); imshow(img_bw);
img_bw2 = bwareaopen(img_bw,4);
figure(3); imshow(img_bw2);

img = imread(sortedImageNames{86});
figure(4); imshow(img);
img_bw = im2bw(img, 0.39);
figure(5); imshow(img_bw);
img_bw22 = bwareaopen(img_bw,4);
figure(6); imshow(img_bw22);

img_diff = imabsdiff(img_bw2,img_bw22);
figure(7); imshow(img_diff);



%s = regionprops(bwlabel(img_bw2(:,:,1)), 'centroid');
%c = [s.Centroid]




%{
img_gray = rgb2gray(img);
figure(3); imshow(img_gray);
img_edge = edge(img_gray,'sobel',0.03);
img_edge = edge(img_bw);
figure(4); imshow(img_edge);
%}