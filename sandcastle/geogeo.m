function Fout = geogeo (x,y1,y2,hh,vv,theta,theta_d)

k = -0.1 / (y2-y1); % x点法线斜率
b=y1-k*x; % 直线方程
xx=-b/k;

OB=[xx,0,0];
BA=[x-xx,y1,0];
BC=OB+[0,0,hh];
AB=-BA;
AC=AB+BC;
AD=[0.1,y2-y1,0];
nn=cross(AD,AC);
L = sqrt(hh^2+mage(AB)); % 斜面长度
heave = dot(nn,[vv,0,0])/mage(nn); % 水流冲击分量
tangent = [vv,0,0]-heave*nn/mage(nn); % 水流切向分量
DRAGFORCE = tangent * heave; % 拖拽力
G=[0,0,0.8172*L*deg2rad((theta-theta_d))*9.8]; % 重力矢量
g = dot(nn,G)/mage(nn); % 
GRAVITY = G - g*nn/mage(nn); % 重力切向分量
Fout = mage(GRAVITY+DRAGFORCE);

end
