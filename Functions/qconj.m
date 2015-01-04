function qout = qconj( qin ) 
%  Quaternion Conjugate for re-assembly robotics.
%   Finds the conjugate of a quaternion according to the logic of
%   reassembly robotics brain
%   Note: Quaternion Multiplication is not commutative
if nargin ~= 1
    error('myApp:argChk', 'Wrong number of input arguments')
end

qout = [ qin(:,1)  -qin(:,2:4) ];

end
