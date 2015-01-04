function [Hout] = type1b(link_vector)
%Type1b transformation for re-assembly robotics
%   Transforms a given link according to re-assembly robotics logic
%   Note: Subset of 'Reassembly Robotics Brain'
%   (C)Copyright 2014 All Rights Reserved BlueStem Proprietary.

%Inputs
prompt={'Which is the first axis D.O.F? (x,y,z):','Which is the second axis D.O.F? (x,y,z):'...
    ,'What is the angle of transformation for the first axis?','What is the angle of transformation for the second axis'...
    'Fix a value for theta? (y/n)','If yes, what is the angle you wish to set for theta?','Si='};
% GUI with all inputs
title='Type1B transformation'; 
% GUI title.
answer=inputdlg(prompt,title); %Creates GUI
%Converts answers to readable values
axis1=sym(answer{1});  
axis2=sym(answer{2});
t1newd=str2double(answer{3});
t2newd=str2double(answer{4});
theta_input_q=sym(answer{5});
theta_dialog=str2double(answer{6});
link=[0,link_vector];
%End conversion of answers
%End inputs

%Error if rotor 1 equals to rotor 2
if axis1==axis2
    error('First axis D.O.F cannot equal to second axis DOF');
end
%End

%Check to see if axis1 and axis2 inputs are logical
true1=isAlways(axis1==('x') | axis1==('y') | axis1==('z'));
true2=isAlways(axis2==('x') | axis2==('y') | axis2==('z'));
if true1==0
    error('Input for first axis DOF is illogical');
end
if true2==0
    error('Input for second axis DOF is illogical');
end
%End Logic Check

%Assigning a directional rotor to axis 1
if axis1==('x')
    axis1=[1,0,0];
elseif axis1==('y')
    axis1=[0,1,0];
elseif axis1==('z')
    axis1=[0,0,1];
end
%End

%Assigning a directional rotor to axis 2
if axis2==('x')
    axis2=[1,0,0];
elseif axis2==('y')
    axis2=[0,1,0];
elseif axis2==('z')
    axis2=[0,0,1];
end
%End

%Present transformed screw (absolute values)
syms t1 t2;

screw1=[cos(t1/2),sin(t1/2)*axis1];
screw2=[cos(t2/2),sin(t2/2)*axis2];
screw=qmult(screw1,screw2); 
syms theta
U=[cos(theta/2), 0, 0, sin(theta/2)];
screwt=qmult(screw,U); %The type1b rotor

screwtinv=qconj(screwt);
U1=qmult(screwt,link);
Hout=qmult(U1,screwtinv);
%End pair transformation (absolute values)

%Convert transformation angles from degrees to radians
t1new=(t1newd/360)*(2*pi);
t2new=(t2newd/360)*(2*pi);
%End angle conversion

%Substitute angles into k-pair equation
H1=subs(Hout,t1,t1new);
H2=subs(H1,t2,t2new);
%End substitution

%Substitution of angle theta into function
if theta_input_q==('y') 
    thetainputd=theta_dialog;
    thetainput=(thetainputd/360)*(2*pi);
    H3=subs(H2,theta,thetainput);
    Hout1=double(H3);
    Hout=Hout1(:,2:end);
elseif theta_input_q==('n') %need to affix link number to angle theta
    prompt2={'What is the link number that is being transformed?'};
    answer2=inputdlg(prompt2);
    theta_subscript=str2num(answer2{1}); % FIX THIS SHIT
    thetanew=zeros(theta_subscript,1)
        for i=1:theta_subscript
        thetanew(i,:)=['theta' num2str(i)];
        syms(thetanew)
        end
    H4=subs(H2,theta,thetanew);
    Hout=H4;
end
%End substitution of theta

Difference_map=link_vector-Hout
end

