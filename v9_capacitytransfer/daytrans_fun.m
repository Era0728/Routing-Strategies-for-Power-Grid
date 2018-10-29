function [ F ] = daytrans_fun( x, b,a,P_load,P_out )
N = 0;
l(1,:)=[zeros(1,1),1,N,N,1,N,N,N,N,N,N,N,N,N];
l(2,:)=[zeros(1,2),3,3.2,1.4,N,N,N,N,N,N,N,N,N];
l(3,:)=[zeros(1,3),1,N,N,N,N,N,N,N,N,N,N];
l(4,:)=[zeros(1,4),2.1,N,0.8,N,1.5,N,N,N,N,N];
l(5,:)=[zeros(1,5),1.8,N,N,N,N,N,N,N,N];
l(6,:)=[zeros(1,6),N,N,N,N,1,1.5,2,N];
l(7,:)=[zeros(1,7),1.2,1,N,N,N,N,N];
l(8,:)=[zeros(1,8),N,N,N,N,N,N];
l(9,:)=[zeros(1,9),1.2,N,N,N,1.5];
l(10,:)=[zeros(1,10),1.4,N,N,N];
l(11,:)=[zeros(1,11),N,N,N];
l(12,:)=[zeros(1,12),1.2,N];
l(13,:)=[zeros(1,13),0.9];
l(14,:)=[zeros(1,14)];
L = l+l';
R = 0.4*L;

load_expect = b*P_load;
source_expect =b/a*P_out';
% source_expect = [0,0,0,0,0,0.343875938999173,0,0,0,0,0,0,0.555504000000000,0.506256000000000]';% situation 1 
% source_expect = [0.426040535368128,0.508713000000000,0.417426000000000,0,0,0,0,0,0,0,0,0,0,0]';
U_rated = 1.5; %situation 1,2

F1 = x(14) - load_expect(1) - x(1)*(x(15)+x(16)); %节点1非标准电压，平衡节点
% F1 = source_expect(1) - load_expect(1) - x(1)*(x(15)+x(16));
F2 = source_expect(2) - load_expect(2) + x(2)*(x(15)-x(17)-x(18)-x(19));
% F2 = x(14) - load_expect(2) + x(2)*(x(15)-x(17)-x(18)-x(19));
F3 = source_expect(3) - load_expect(3) + x(3)*(x(17)-x(20));
F4 = source_expect(4) - load_expect(4) + x(4)*(x(18)+x(20)-x(21)-x(22)-x(23));
F5 = source_expect(5) - load_expect(5) + x(5)*(x(16)+x(19)+x(21)-x(24));
F6 = source_expect(6) - load_expect(6) + x(6)*(x(24)-x(25)-x(26)-x(27));%节点6非标准电压，非平衡节点
% F6 = x(14) - load_expect(6) + x(6)*(x(24)-x(25)-x(26)-x(27));
F7 = source_expect(7) - load_expect(7) + x(7)*(x(22)-x(28)-x(29));
F8 = source_expect(8) - load_expect(8) + x(8)*x(28);
F9 = source_expect(9) - load_expect(9) + x(9)*(x(23)+x(29)-x(30)-x(31));
F10 = source_expect(10) - load_expect(10) + x(10)*(x(30)-x(32));
F11 = source_expect(11) - load_expect(11) + x(11)*(x(25)+x(32));
F12 = source_expect(12) - load_expect(12) + x(12)*(x(26)-x(33));
F13 = source_expect(13) - load_expect(13) + x(13)*(x(27)+x(33)-x(34));%节点13非标准电压，非平衡节点
% F13 = x(1)- load_expect(13) + x(13)*(x(27)+x(33)-x(34));%节点13非标准电压，平衡节点
% F14 = source_expect(14) - load_expect(14) + x(14)*(x(31)+x(34));
F14 = source_expect(14) - load_expect(14) + U_rated*(x(31)+x(34));

% F15 = U_rated - x(2) - x(15)*R(1,2);
% F16 = U_rated - x(5) - x(16)*R(1,5);
F15 = x(1) - x(2) - x(15)*R(1,2);
F16 = x(1) - x(5) - x(16)*R(1,5);
F17 = x(2) - x(3) - x(17)*R(2,3);
F18 = x(2) - x(4) - x(18)*R(2,4);
F19 = x(2) - x(5) - x(19)*R(2,5);
F20 = x(3) - x(4) - x(20)*R(3,4);
F21 = x(4) - x(5) - x(21)*R(4,5);
F22 = x(4) - x(7) - x(22)*R(4,7);
F23 = x(4) - x(9) - x(23)*R(4,9);
F24 = x(5) - x(6) - x(24)*R(5,6);
F25 = x(6) - x(11) - x(25)*R(6,11);
F26 = x(6) - x(12) - x(26)*R(6,12);
F27 = x(6) - x(13) - x(27)*R(6,13);
F28 = x(7) - x(8) - x(28)*R(7,8);
F29 = x(7) - x(9) - x(29)*R(7,9);
F30 = x(9) - x(10) - x(30)*R(9,10);
% F31 = x(9) - x(14) - x(31)*R(9,14);
F31 = x(9) - U_rated - x(31)*R(9,14);
F32 = x(10) - x(11) - x(32)*R(10,11);
F33 = x(12) - x(13) - x(33)*R(12,13);
% F34 = x(13) - x(14) - x(34)*R(13,14);
F34 = x(13) - U_rated - x(34)*R(13,14);

F = [F1;F2;F3;F4;F5;F6;F7;F8;F9;F10;F11;F12;F13;F14;...
    F15;F16;F17;F18;F19;F20;F21;F22;F23;F24;F25;F26;F27;F28;F29;F30;F31;F32;F33;F34];

end