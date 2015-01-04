function [ qout ] = qrot( q,r )
%  Quaternion Rotation for re-assembly robotics.
%   Finds the rotated form of a quaternion according to the logic of
%   reassembly robotics brain

Qconj=qconj(q); %Find conjugate
V=size(r,1); %Number of links
zero=zeros(V,1); %Zero column
rout=[zero,r] ; %Add 0 to make it 1x4 vector
Q1=qmult(q,rout); %First part 
qlol=qmult(Q1,Qconj); 
qout=simplify(qlol);%Output
end

