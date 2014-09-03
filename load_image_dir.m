function [ sortedFileNames ] = load_image_dir( image_directory )

imageNames = dir(fullfile(image_directory,'*.jpg'));
imageNames = {imageNames.name}';
imageStrings = regexp([imageNames{:}],'(\d*)','match');
imageNumbers = str2double(imageStrings);
[~,sortedIndices] = sort(imageNumbers);
sortedImageNames = imageNames(sortedIndices);

sortedFileNames = fullfile(image_directory,sortedImageNames);

end

