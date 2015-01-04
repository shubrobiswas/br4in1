function [ qout ] = qrot2( q,r )
%  Quaternion Rotation for re-assembly robotics.
%   Finds the rotated form of a quaternion according to the logic of
%   reassembly robotics brain

Qconj=qconj(q); %Find conjugate
% V=size(r,1); %Number o links
% zero=zeros(V,1); %Zero column
% rout=[zero,r] ; %Add 0 to make it 1x4 vector
Q1=qmult(q,r); %First part 
qout=qmult(Q1,Qconj); %Output
end

