function Exercise_1
%EXERCISE_1 Complete takes in exercise 1 of the practical
%   Detailed explanation goes here

%% Setup
s_freq = 50e6;
[t,f] = make_t_f(0,1/50,s_freq);


% Define the message as a function handle
m_t = -4*cos(100*pi*t)+3*sin(200*pi*t)+3*sin(300*pi*t);

f_c = 1e6; % Carrier frequency

% Plot message singal for referance 

% time domain
figure
plot(t,m_t);
title("Message Signal m(t)");
xlabel("t (s)");

% frequecy doamin
M_f = fspect(m_t);
figure
yyaxis left
stem(f,real(M_f),'.');
ylim([-2.1,2.1]);
yyaxis right
stem(f,imag(M_f),'.');
ylim([-2.1,2.1]);
ytickformat('%gj');
xlim([-400,400]);
ax = gca;
title("Frequency spectrum of message signal M(f)");

%% Part a

% Find modulated time domain signal 
dsbfc_t = DSBFC_AM(m_t,f_c,t,0.7);  % Time domain
DSBFC_f = fspect(dsbfc_t);          % f domain

% Plot signal in time domain
% Show Full message period
figure
plot(t*1e3,dsbfc_t);
title("Time Domain Plot of DSB-FC Modulated Signal - Full Period")
xlabel("t (ms)");

% Show only first 25 µs so that carrier is clearly visisble
figure
plot(t*1e6,dsbfc_t);
xlim([0,25*1e6/f_c]);
title("Time Domain Plot of DSB-FC Modulated Signal - First 25 µs")
xlabel("t (µs)");

% Frequecy domain plot
figure
tiled = tiledlayout(1,2,'TileSpacing','compact');  % Create tiled chart
bgAx = axes(tiled,'XTick',[],'YTick',[],'Box','off');
bgAx.Layout.TileSpan = [1 2];

ax1 = axes(tiled);
stem(ax1,f,abs(DSBFC_f),'.');
xline(ax1,-f_c+400,':');
ax1.Box = 'off';
xlim(ax1,[-f_c-400,-f_c+400]);

ax2 = axes(tiled);
ax2.Layout.Tile = 2;    % Move axes to second tile in layout
stem(ax2,f,abs(DSBFC_f),'.');
xline(ax2,f_c-400,':');
ax2.Box = 'off';
ax2.YAxis.Visible = 'off';
xlim(ax2,[f_c-400,f_c+400]);

% Link both y axes
linkaxes([ax1 ax2], 'y');

env = envelope(dsbfc_t);

figure
plot(t,env);

%% Part b

ssbsc_t = SSBSC_AM_LSB(m_t,f_c,t);
SSBSC_f = fspect(ssbsc_t);

figure
plot(t,ssbsc_t);
figure
stem(f,abs(SSBSC_f));
xlim([1e6-400,1e6+400])

end
