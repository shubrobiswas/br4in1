function [ Xtheta ] = Xtheta(Vdot,Si,sl)
V=size(Vdot,1); %Number of links
theta=thetageneration(V); %Generation of V-sized cell of theta symbols
coses=cos(theta/2); %Self explanatory, to amend bigger quaternion matrix
l=sin(theta/2); %Same as above

%Multiplication of Each row of Si with sin(theta/2)
z=[];
for i = 1:size(l,1);
t= l(i,:)*Si(i,:);
z=[z;t];
end

U=[coses,z];
S=qrot(U,Vdot);
k=U;
n=size(k,1);
if n==1
    qout=zeros(n,4);
end
%Generation of globalising quaternions

for i=1:n-1
if i-1>0
    qout(i+1,:)=qmult(k(i,:),k(i-1,:));
elseif i-1==0
    qout(i+1,:)=k(i,:);
end
end
qout(1)=1; %First value of the first row equals to 1
if size(qout,1)>1
    qout=simplify(qout); %Simplification (no hysterisis)
end
S1=qrot2(qout,S); %Quaternion rotation of globalising quaternions with unglobalised QRmaps
S3=sum(S1,1); %Sum of the columns
qrout=simplify(S3);


BoldQR=qrout;
BoldQR=BoldQR(:,2:4);
S1=S1(:,2:4);
S1=simplify(S1);
Section2=S1(sl,:);
Xtheta=[BoldQR,Section2];
end