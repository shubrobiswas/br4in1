function [K1] = kinematicmap(links,Si)
%Kinematic map of a linkage
%   %Reassembly Robotics 2014/15
Si=[0,1,0];
Vdot=[1,0,0];
qr1=qrmap(Vdot,Si);

QRmap=qr1(:,2:4);

number=size(links,1);
K = zeros(360*360, number);
for m = 0:5:359
    for n = 1:5:360
        for d =10
            K(m*360 + n, 1) = cosd(m)+cosd(m+n);
            K(m*360 + n, 2) = sind(m)+sind(m+n);
            K(m*360 + n, 3) = -d;
        end
    end
end
K(all(K==0,2),:)=[];

plot3(K(:,1),K(:,2),K(:,3),'.');
end

