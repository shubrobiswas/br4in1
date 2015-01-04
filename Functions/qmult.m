function [qout] = qmult(q,r)
%Quaternion Multiplication for re-assembly robotics
%   Multiplies a set of quaternions according to the logic set up in
%   re-assembly robotics papers
%   Note: Quaternion Multiplication is not commutative

%Logic Checks

narginchk(1, 2); %Returns error if number of inputs is less than 1 or greater than 2

% Calculate vector portion of quaternion product
% vec = s1*v2 + s2*v1 + cross(v1,v2)
vec = [q(:,1).*r(:,2) q(:,1).*r(:,3) q(:,1).*r(:,4)] + ...
         [r(:,1).*q(:,2) r(:,1).*q(:,3) r(:,1).*q(:,4)]+...
         [ q(:,3).*r(:,4)-q(:,4).*r(:,3) ...
           q(:,4).*r(:,2)-q(:,2).*r(:,4) ...
           q(:,2).*r(:,3)-q(:,3).*r(:,2)];

% Calculate scalar portion of quaternion product
% scalar = s1*s2 - dot(v1,v2)
scalar = q(:,1).*r(:,1) - q(:,2).*r(:,2) - ...
             q(:,3).*r(:,3) - q(:,4).*r(:,4);
    
qout = [scalar  vec];


end

