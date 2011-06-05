% Converts A Color Image to a Black and White BitMap
% By Bryan A. Clifford
% Modified 6/17/2009

% Prompts the user for image file name and asks if they want the data to be
% written to file.
ImageName = input('Enter Image File Name: ','s');
writetofile = input('Write To File? (Y or N): ','s');

% Prompts the user for the name of the new file if they answered 'y' or 'Y'
if strcmp(writetofile,'y') || strcmp(writetofile,'Y')
    
    NewImageName = input('Enter New Image Name in single quotes: ');

end

% A 3D array that represents the image
A = double(imread(ImageName));

% A matrix that contains the dimensions of 'A'
Size = size(A);

% Fills 'newImage' with the average values of the first 2 dimensions of
% 'A'.
newImage = A(:,:,1)/3 + A(:,:,2)/3 + A(:,:,3)/3;

% Converts 'newImage' to an image format
newImage = uint8(newImage);

% Displays 'newImage'
imshow(newImage);
title('B&W Image');

%Writes 'newImage' to a BitMap if user specified.
if strcmp(writetofile,'y') || strcmp(writetofile,'Y')
    
    imwrite(newImage, NewImageName);
    disp('New image written to file ')
end
