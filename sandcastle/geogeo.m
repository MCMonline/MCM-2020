function Fout = geogeo (x,y1,y2,hh,vv,theta,theta_d)

k = -0.1 / (y2-y1); % x�㷨��б��
b=y1-k*x; % ֱ�߷���
xx=-b/k;

OB=[xx,0,0];
BA=[x-xx,y1,0];
BC=OB+[0,0,hh];
AB=-BA;
AC=AB+BC;
AD=[0.1,y2-y1,0];
nn=cross(AD,AC);
L = sqrt(hh^2+mage(AB)); % б�泤��
heave = dot(nn,[vv,0,0])/mage(nn); % ˮ���������
tangent = [vv,0,0]-heave*nn/mage(nn); % ˮ���������
DRAGFORCE = tangent * heave; % ��ק��
G=[0,0,0.8172*L*deg2rad((theta-theta_d))*9.8]; % ����ʸ��
g = dot(nn,G)/mage(nn); % 
GRAVITY = G - g*nn/mage(nn); % �����������
Fout = mage(GRAVITY+DRAGFORCE);

end