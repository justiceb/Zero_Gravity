clc; clear; close all;

vidfile = '../Video/3clip3.wmv';
[workingdir,NAME,EXT] = fileparts(vidfile);
addpath(workingdir);
[SUCCESS,MESSAGE,MESSAGEID] = mkdir(fullfile(workingdir,NAME));
[SUCCESS,MESSAGE,MESSAGEID] = mkdir(fullfile(workingdir,NAME,'raw'));
[SUCCESS,MESSAGE,MESSAGEID] = mkdir(fullfile(workingdir,NAME,'cropped'));
[SUCCESS,MESSAGE,MESSAGEID] = mkdir(fullfile(workingdir,NAME,'thresh'));

vid = VideoReader(vidfile);
for ii = 1:vid.NumberOfFrames
    img = read(vid,ii);

    % Write out to a JPEG file (img1.jpg, img2.jpg, etc.)
    imwrite(img,fullfile(workingdir,NAME,'raw',sprintf('img%d.jpg',ii)));
end

sortedImageNames = load_image_dir(fullfile(workingdir,NAME,'raw'));
img = imread(sortedImageNames{1} );
figure(1); imshow(img);

[img_cropped, rect] = imcrop;
close all
for ii = 1:1:length(sortedImageNames)
    img = imread(sortedImageNames{ii} );
    img_cropped = imcrop(img , rect);
    imwrite(img_cropped,fullfile(workingdir,NAME,'cropped',sprintf('img%d_crop.jpg',ii)));
end

sortedImageNames = load_image_dir(fullfile(workingdir,NAME,'cropped'));
for ii = 1:1:length(sortedImageNames)
    img = imread(sortedImageNames{ii} );
    img_thresh = im2bw(img, 0.39);
    imwrite(img_thresh,fullfile(workingdir,NAME,'thresh',sprintf('img%d_thresh.jpg',ii)));
end

fprintf('                        done! \n')


%{
img = imread('test - cropped.png');
figure(1); imshow(img);
img_bw = im2bw(img, 0.39);
figure(2); imshow(img_bw);


[B,L] = bwboundaries(img_bw,'noholes');
figure(3); imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
%}



