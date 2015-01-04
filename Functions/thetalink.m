function [thetanew] = thetalink(link_no)
%Converts theta to theta affixed with link number
%   i.e from theta to theta5 for link 5

link_no=single(link_no);
for i=1:link_no
  eval(sprintf('theta%d = [1]', i));
end

