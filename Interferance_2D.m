% Creates interference patterns in an image called 'Img'
% Created by Bryan A. Clifford
% Last Modified on 4.13.2009

% Clears all values stored in the array 'Img' and then clears consol screen
clear
clc

% Variables
height = 1e-6;                	% real height of config in meters
width  = height;                % real width of config in meters
waveLength = 100e-9;            % wavlength of incident plane wave in a vacuum in meters
rfcIdx = 1;                     % refractive index of the medium
Img_width = 5e-6;             	% # real width of Img in meters
Img_height = 5e-6;         		% # real height of Img in meters
vres = 1e-9;           % real height of a pixel in meters
hres = vres;   % real width of a pixel in meters

% Calculates the wave # of the incident plane wave
k = 2*pi*rfcIdx/waveLength;

% Makes Img a matrix filled with zeros 
Img = zeros(round(Img_height/vres),round(Img_width/vres));

% Gets dimensions of 'Img'
Img_dim = size(Img);

% Gets location of config boundaries & midpoint
ctr = [round(Img_dim(1)/2),round(Img_dim(2)/2)];   % Position in Img of the center of the config [y,x]
top = round(ctr(1) - .5*height/vres);
bot = round(ctr(1) + .5*height/vres);
left = round(ctr(2) - .5*width/hres);
right = round(ctr(2) + .5*width/hres);

% Creates Amplitude Diffraction Pattern
for m = ctr(2)%left:(right-left)/1:right
    for n = ctr(1)%top:(bot-top):bot
        for i = 1:Img_dim(1)
            for j = 1:Img_dim(2)
                % Calculates r
                x1 = m;
                y1 = ctr(1) - n;
                x2 = j - 1;
                y2 = ctr(1) - i;
                chgX_pxl = x2 - x1;
                chgX_real = chgX_pxl*hres;
                chgY_pxl = y2 - y1;
                chgY_real = chgY_pxl*vres;
                r = sqrt(chgX_real^2 + chgY_real^2);

                % Calculates amplitude of the electric field at Img(i,j)
                Img(i,j) = Img(i,j)...
                    + .25*sqrt(height^2+width^2)*cos(k*r)/r;
            end
        end
    end
end

% Calculates Intensity Driffraction Pattern
for i = 1:Img_dim(1)
    for j = 1:Img_dim(2)
        Img(i,j) = Img(i,j)^2;
    end
end


% Displays Image
imshow(Img);


