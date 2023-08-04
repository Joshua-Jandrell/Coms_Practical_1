function Exercise_1
%EXERCISE_1 Complete takes in exercise 1 of the practical
%   Detailed explanation goes here

%% Setup
s_freq = 50e6;  % Sampling frequency
[t,f] = make_t_f(0,1/25,s_freq);

% Define the message signal
m_t = 4*cos(100*pi*t)+3*sin(200*pi*t)+3*sin(300*pi*t);


%% Plot message signal for reference
% time domain
figure
plot(t,m_t);
title("Time Domain Waveform of Message Signal, m(t)");
xlabel("t (s)");

% frequency domain
M_f = fspect(m_t);
figure
yyaxis left
stem(f,real(M_f),'.');
ylim([-2.1,2.1]);
ylabel("Real");
yyaxis right
stem(f,imag(M_f),'.');
ylim([-2.1,2.1]);
ytickformat('%gj');
ylabel("Imaginary")
xlim([-200,200]);
title("Frequency spectrum of message signal, M(f)");

%% Part a
f_c = 1e6; % Carrier frequency
dsbfc_t = DSBFC_AM(m_t,f_c,t,0.7);  % Find modulated signal in time domain
DSBFC_f = fspect(dsbfc_t);          % Convert to frequency domain

% Plot signal in time domain
% Show Full message period
figure
plot(t*1e3,dsbfc_t);
title("Time Domain Plot of DSB-FC Modulated Signal")
xlabel("t (ms)");

% Show only first 25 µs so that carrier is clearly visisble
figure
plot(t*1e6,dsbfc_t);
xlim([0,25*1e6/f_c]);
%%title("Time Domain Plot of DSB-FC Modulated Signal - First 25 µs")
xlabel("t (µs)");

% Frequecy domain plot
figure
tiled = tiledlayout(1,2,'TileSpacing','compact');  % Create tiled chart
xlabel("Frequecy (MHz)")
bgAx = axes(tiled,'XTick',[],'YTick',[],'Box','off');
plotScale = 1e-6;
ylims = [-0.1,0.55];
xlimit = 200*plotScale;
bgAx.Layout.TileSpan = [1 2];
% negative range
ax1 = axes(tiled);
yyaxis(ax1,'left');
stem(ax1,f*plotScale,real(DSBFC_f),'.');
ylim(ylims);
yyaxis(ax1,'right');
stem(ax1,f*plotScale,imag(DSBFC_f),'.');
ylim(ylims);
xline(ax1,-f_c+400,':');
ax1.YAxis(2).Visible = "off";
ax1.Box = 'off';
xlim(ax1,[-f_c*plotScale-xlimit,-f_c*plotScale+xlimit]);
xline(ax1,-f_c*plotScale+xlimit-1*plotScale,':');
% posative range
ax2 = axes(tiled);
ax2.Layout.Tile = 2;    % Move axes to second tile in layout
yyaxis(ax2,'left');
stem(ax2,f*plotScale,real(DSBFC_f),'.');
ylim(ylims);
yyaxis(ax2,'right');
stem(ax2,f*plotScale,imag(DSBFC_f),'.');
ylim(ylims);
ytickformat('%gj');
ax2.Box = 'off';
ax2.YAxis(1).Visible = 'off';
xlim(ax2,[f_c*plotScale-xlimit,f_c*plotScale+xlimit]);
xline(ax2,f_c*plotScale-xlimit+1*plotScale,':');
linkaxes([ax1 ax2], 'y');   % Link both y axes


% Plot envelop
env_t = envelope(dsbfc_t);    % Find envelope
ENV_f = fspect(env_t);

figure
plot(t,env);
figure
stem(f,abs(ENV_f))
xlim([-300 300])

%% Part b
ssbsc_t = SSBSC_AM_LSB(m_t,f_c,t);
SSBSC_f = fspect(ssbsc_t);
 % Time domain plot
figure
plot(t,ssbsc_t);
% Frequecy domain plot
figure
tiled = tiledlayout(1,2,'TileSpacing','compact');  % Create tiled chart
xlabel("Frequecy (MHz)")
bgAx = axes(tiled,'XTick',[],'YTick',[],'Box','off');
plotScale = 1e-6;
ylims = [-0.1,0.55];
xlimit = 200*plotScale;
bgAx.Layout.TileSpan = [1 2];
% negative range
ax1 = axes(tiled);
yyaxis(ax1,'left');
stem(ax1,f*plotScale,real(DSBFC_f),'.');
ylim(ylims);
yyaxis(ax1,'right');
stem(ax1,f*plotScale,imag(DSBFC_f),'.');
ylim(ylims);
xline(ax1,-f_c+400,':');
ax1.YAxis(2).Visible = "off";
ax1.Box = 'off';
xlim(ax1,[-f_c*plotScale-xlimit,-f_c*plotScale+xlimit]);
xline(ax1,-f_c*plotScale+xlimit-1*plotScale,':');
% posative range
ax2 = axes(tiled);
ax2.Layout.Tile = 2;    % Move axes to second tile in layout
yyaxis(ax2,'left');
stem(ax2,f*plotScale,real(DSBFC_f),'.');
ylim(ylims);
yyaxis(ax2,'right');
stem(ax2,f*plotScale,imag(DSBFC_f),'.');
ylim(ylims);
ytickformat('%gj');
ax2.Box = 'off';
ax2.YAxis(1).Visible = 'off';
xlim(ax2,[f_c*plotScale-xlimit,f_c*plotScale+xlimit]);
xline(ax2,f_c*plotScale-xlimit+1*plotScale,':');
linkaxes([ax1 ax2], 'y');   % Link both y axes


end
