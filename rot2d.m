% Rotates a 2D vector by an angle (in radians) and returns the rotated vector matrix
% Created by Bryan Clifford

function R = rot2d(angle)
angle
% vec_in is the original 2d vector
% angle is the angle (in radians) that vec_in will be rotated by
% vec_out is the rotated vector

R = [cos(angle), -sin(angle)
     sin(angle), cos(angle)];
end


 
