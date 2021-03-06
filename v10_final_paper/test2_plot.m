% 14节点一个时刻潮流计算
% 最短路径，排列随机
M = inf;
connect(1,:)=[zeros(1,1),1,M,M,1,M,M,M,M,M,M,M,M,M];
connect(2,:)=[zeros(1,2),1,1,1,M,M,M,M,M,M,M,M,M];
connect(3,:)=[zeros(1,3),1,M,M,M,M,M,M,M,M,M,M];
connect(4,:)=[zeros(1,4),1,M,1,M,1,M,M,M,M,M];
connect(5,:)=[zeros(1,5),1,M,M,M,M,M,M,M,M];
connect(6,:)=[zeros(1,6),M,M,M,M,1,1,1,M];
connect(7,:)=[zeros(1,7),1,1,M,M,M,M,M];
connect(8,:)=[zeros(1,8),M,M,M,M,M,M];
connect(9,:)=[zeros(1,9),1,M,M,M,1];
connect(10,:)=[zeros(1,10),1,M,M,M];
connect(11,:)=[zeros(1,11),M,M,M];
connect(12,:)=[zeros(1,12),1,M];
connect(13,:)=[zeros(1,13),1];
connect(14,:)=[zeros(1,14)];
Connect=connect+connect';

N = 0;
% r(1,:)=[zeros(1,1),0.01938,N,N,0.05403,N,N,N,N,N,N,N,N,N];
% r(2,:)=[zeros(1,2),0.04699,0.05811,0.05695,N,N,N,N,N,N,N,N,N];
% r(3,:)=[zeros(1,3),0.06701,N,N,N,N,N,N,N,N,N,N];
% r(4,:)=[zeros(1,4),0.01335,N,10e-6,N,10e-6,N,N,N,N,N];
% r(5,:)=[zeros(1,5),10e-6,N,N,N,N,N,N,N,N];
% r(6,:)=[zeros(1,6),N,N,N,N,0.09498,0.12291,0.06615,N];
% r(7,:)=[zeros(1,7),10e-6,10e-6,N,N,N,N,N];
% r(8,:)=[zeros(1,8),N,N,N,N,N,N];
% r(9,:)=[zeros(1,9),0.03181,N,N,N,0.12711];
% r(10,:)=[zeros(1,10),0.08205,N,N,N];
% r(11,:)=[zeros(1,11),N,N,N];
% r(12,:)=[zeros(1,12),0.22092,N];
% r(13,:)=[zeros(1,13),0.17093];
% r(14,:)=[zeros(1,14)];
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

% R = 220^2/100*R;

Q = 0.25;
W = 0;
cap_line(1,:)=[zeros(1,1),Q,W,W,Q,W,W,W,W,W,W,W,W,W];
cap_line(2,:)=[zeros(1,2),Q,Q,Q,W,W,W,W,W,W,W,W,W];
cap_line(3,:)=[zeros(1,3),Q,W,W,W,W,W,W,W,W,W,W];
cap_line(4,:)=[zeros(1,4),Q,W,Q,W,Q,W,W,W,W,W];
cap_line(5,:)=[zeros(1,5),Q,W,W,W,W,W,W,W,W];
cap_line(6,:)=[zeros(1,6),W,W,W,W,Q,Q,Q,W];
cap_line(7,:)=[zeros(1,7),Q,Q,W,W,W,W,W];
cap_line(8,:)=[zeros(1,8),W,W,W,W,W,W];
cap_line(9,:)=[zeros(1,9),Q,W,W,W,Q];
cap_line(10,:)=[zeros(1,10),Q,W,W,W];
cap_line(11,:)=[zeros(1,11),W,W,W];
cap_line(12,:)=[zeros(1,12),Q,W];
cap_line(13,:)=[zeros(1,13),Q];
cap_line(14,:)=[zeros(1,14)];
Capacity_line=cap_line+cap_line';

I_real = zeros(size(Connect));
U_real = zeros(size(Connect));

% load_expect = [0	2.070721847	4.141443694	1.035360924	2.070721847	3.106082771	1.553041385	5.176804618	4.659124156	0.621216554	1.035360924	1.035360924	1.035360924	2.174257939]';
% load_expect_original =0.1*[0 2.07 4.14 1.03 2.07 3.10 1.55 5.17	4.65 0.62 1.03 1.03	1.03 2.17]';
% load_expect = [0 0 0 1 2 3 2 5 5 1 1 1 1 2]';
% load_expect = [0 2 4 1 2 3 1 5 4 0 1 1 1 2]';
% load_expect = [1 2 3 4 5 6 7 8 9 10 11 12 13 14]';
% load_expect = [2 2 3 3 4 4 5 5 4 4 3 3 2 2]';
% source_expect = [20 20 0 0 0 0 0 0 0 0 0 0 0 0]';
% source_expect_original = [10 10 10 6 0 10 0 10 0 6 0 0 6 0]'; % MW
% source_expect = [8 8 8 6 0 8 0 6 0 0 0 0 6 0]';
% source_expect = [6 6 6 4 0 6 0 6 0 4 0 0 4 0]';
% source_expect = [30 30 30 20 0 30 0 30 0 20 0 0 20 0]';
% source_expect = [30 30 30 0 0 0 0 0 0 0 0 0 0 0]'; % MW
% load_expect = [0 2 4 1 2 3 1 5 4 0 1 1 1 2]';
% source_expect = [8 8 8 6 0 8 0 6 0 0 0 0 6 0]';
% load_expect = [0 0 0 0 2 0 1 0 4 0 1 1 0 2]';
% source_expect_original = [8 6 4 5 0 5 0 1 0 0 0 0 5 0]';
% source_expect_original = 0.1*[8 6 6 0 0 8 0 8 0 0 0 0 0 0 ]';

% load_expect_original =0.1*[0 2.07 4.14 1.03 2.07 3.10 1.55 5.17	4.65 0.62 1.03 1.03	1.03 2.17]'; % 1_1
% load_expect_original =0.1*[0 1.33 2.67 0.66 1.33 2.00 1.00 3.34 3.01 0.40 0.66 0.66 0.66 1.40 ]';
% load_expect_original =0.1*[0 1.53 2.67 0.66 1.03 2.00 1.00 3.34 3.01 0.40 0.66 0.76 0.56 1.40 ]'; %1_2
load_expect_original =0.1*[0 1.15 2.3 0.57 1.15 1.72 0.86 2.57 2.58 0.34 0.57 0.67 0.77 1.20 ]'; %1_3
source_expect_original = 0.1*[8 6 6 0 0 8 0 8 0 0 0 0 0 0 ]';

modify = source_expect_original - load_expect_original;
modify_index_load = find(modify > 0);
modify_index_source = find(modify < 0);
source_expect = modify;
source_expect(modify_index_source) = 0;
load_expect = modify;
load_expect(modify_index_load) = 0;
load_expect = abs(load_expect);

power_demand = sum(load_expect_original);

U_rated = 1.5; % kV
eff = 0.97;
source = find(all(source_expect ~=0,2))';

priority = [2 3];
times = 1;
while(times <= 5000)
    source_status = zeros(size(source_expect));
    data_I_expect = I_real;
    data_U_expect = U_real;
    [point, time] = size(load_expect);
    P_load = zeros(1,length(Connect));
    P_out = zeros(1,length(Connect));
    
    index = randperm(length(load_expect))';
    content = load_expect(index);
    for j = 1:1:point
        destination = index(j);
        P_demand = content(j);
        if P_demand > 0
        [ data, data_I_expect, data_U_expect, P_load, P_out] = Limited_ShortestPath_loss_Priority(Connect, data_I_expect, ...
            data_U_expect, P_load, P_demand, destination, U_rated, source, source_expect, Capacity_line, R, P_out, eff, priority );

%         [ data, data_I_expect, data_U_expect, P_load, P_out] = Limited_ShortestPath_loss(Connect, data_I_expect, ...
%             data_U_expect, P_load, P_demand, destination, U_rated, source, source_expect, Capacity_line, R, P_out, eff );
        end
    end
    
    P_load = P_load + (source_expect_original'-source_expect');
    P_out = P_out + (source_expect_original'-source_expect');

    power_load_expect = sum(P_load);
    power_source_expect = sum(P_out);
    Status_up = triu(data_I_expect);
    powerloss_total_expect = power_source_expect - power_load_expect;
    powerloss_line_expect = sum(sum((Status_up.^2.*R)));
    powerloss_router_expect = powerloss_total_expect - powerloss_line_expect;
    lossline_expect = powerloss_line_expect/power_load_expect;
    lossrouter_expect = powerloss_router_expect/power_load_expect;
    losstotal_expect = powerloss_total_expect/power_load_expect;
    
    if power_demand == power_load_expect
        record_demand(times) = 1;
        record_index(times,:) = index;
        record_powerloss_total(times) =  losstotal_expect;
        record_powerloss_router(times) = lossrouter_expect;
        record_powerloss_line(times) = lossline_expect;
        times = times+1;
    elseif power_demand > power_load_expect
        record_demand(times) = -1;
    elseif power_demand < power_load_expect
        record_demand(times) = 0;
    end
end
%%
tt = 1:1:5000;
figure(1);
plot(tt,record_powerloss_total,'.b');hold on;

source_status = zeros(size(source_expect));
data_I_expect = I_real;
data_U_expect = U_real;
[point, time] = size(load_expect);
P_load = zeros(1,length(Connect));
P_out = zeros(1,length(Connect));
[content,index] = sort(load_expect,'descend');

for j = 1:1:point
    destination = index(j);
    P_demand = content(j);
    if P_demand > 0
    [ data, data_I_expect, data_U_expect, P_load, P_out] = Limited_ShortestPath_loss_Priority(Connect, data_I_expect, ...
            data_U_expect, P_load, P_demand, destination, U_rated, source, source_expect, Capacity_line, R, P_out, eff, priority );
%     [ data, data_I_expect, data_U_expect, P_load, P_out] = Limited_ShortestPath_loss(Connect, data_I_expect, ...
%         data_U_expect, P_load, P_demand, destination, U_rated, source, source_expect, Capacity_line, R, P_out, eff );
    end
end
P_load = P_load + (source_expect_original'-source_expect');
P_out = P_out + (source_expect_original'-source_expect');

power_load_expect = sum(P_load);
power_source_expect = sum(P_out);
Status_up = triu(data_I_expect);
powerloss_total_expect = power_source_expect - power_load_expect;
powerloss_line_expect = sum(sum((Status_up.^2.*R)));
powerloss_router_expect = powerloss_total_expect - powerloss_line_expect;
lossline_expect = powerloss_line_expect/power_load_expect;
lossrouter_expect = powerloss_router_expect/power_load_expect;
losstotal_expect = powerloss_total_expect/power_load_expect;

plot(tt,losstotal_expect*ones(length(tt)),'-r'); %从大到小的排列
%%
better = length(find(record_powerloss_total < losstotal_expect));% 比现有方法好的情况
location = (losstotal_expect - min(record_powerloss_total))/(max(record_powerloss_total)...
    -min(record_powerloss_total));% 现有方法的位置
notenough = length(find(record_demand == -1));%多少种情况没有供上电
warn = length(find(record_demand == 0)); %异常情况
