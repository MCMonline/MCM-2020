function outout = Fc (theta,theta_d,Gamma)
r=0.001;%(0.0003~0.0015);
outout=1.2*pi*Gamma*r*cos(deg2rad(theta_d))*(3*0.64/(4*pi*r^3))^(2/3) / (sqrt(6)*deg2rad(theta-theta_d));
end