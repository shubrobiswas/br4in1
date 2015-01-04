function mod = quatmod( q )
%  QMOD Calculate the modulus of a quaternion.
%   Finds the modulus of a quaternion according to the logic of
%   reassembly robotics brain

for index = size(q,1):-1:1
    mod(index,:) = norm(q(index,:),2);
end
