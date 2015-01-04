function [theta_new] =thetageneration(n)
%Generates the number of thetas required for a n-sized linkage.
%   Note: Subset of 'Reassembly Robotics Brain'
%   (C)Copyright 2014 All Rights Reserved BlueStem Proprietary.

theta_new = sym(zeros(n,1));
for k=1:n;
    theta_new(k)=sym(sprintf('theta%d',k));
end   

end

