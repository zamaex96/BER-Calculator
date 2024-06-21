clear all
M1 = readmatrix('data2.xlsx');
[ber1,bsr1] = ber(M1);
M2 = readmatrix('d2.xlsx');
[ber2,bsr2] = ber(M2);
M3 = readmatrix('d3.xlsx');
[ber3,bsr3] = ber(M3);
M4 = readmatrix('d4.xlsx');
[ber4,bsr4] = ber(M4);
M5 = readmatrix('d5.xlsx');
[ber5,bsr5] = ber(M5);
M6 = readmatrix('d6.xlsx');
[ber6,bsr6] = ber(M6);
M7 = readmatrix('d7.xlsx');
[ber7,bsr7] = ber(M7);
M8 = readmatrix('d8.xlsx');
[ber8,bsr8] = ber(M8);
M9 = readmatrix('d9.xlsx');
[ber9,bsr9] = ber(M9);
M10 = readmatrix('d10.xlsx');
[ber10,bsr10] = ber(M10);
M11 = readmatrix('d11.xlsx');
[ber11,bsr11] = ber(M11);
BER=[ber1 ber2 ber3 ber4 ber5 ber6 ber7 ber8 ber9 ber10 ber11];
BSR=[bsr1 bsr2 bsr3 bsr4 bsr5 bsr6 bsr7 bsr8 bsr9 bsr10 bsr11];
subplot(2,1,1)
p1=plot(1:11,BSR,'k');
p1.Marker="square";
p1.LineWidth=2;
hold on
p2=plot(1:11,BER,'b');
xlabel({'data','(i)'})
ylabel({'Rate','(x)'})
p2.Marker="diamond";
p2.LineWidth=2;
title('Plot')
xlim([0 12]);
ylim([.45 .55]);
legend([p1 p2],{'BSR','BER'})

subplot(2,1,2)
xq1 = 1:.01:11;
p = pchip(1:11,BER,xq1);
s = spline(1:11,BER,xq1);
m = makima(1:11,BER,xq1);
plot(1:11,BER,'o',xq1,p,'-',xq1,s,'-.',xq1,m,'--');
legend('Sample Points','pchip','spline','makima','Location','SouthEast')

