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
xlabel("time (s)");

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
xlabel("frequency (Hz)");
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
xlabel("time (ms)");

% Show only first 25 µs so that carrier is clearly visisble
figure
plot(t*1e6,dsbfc_t);
xlim([0,25*1e6/f_c]);
%%title("Time Domain Plot of DSB-FC Modulated Signal - First 25 µs")
xlabel("time (µs)");

% Frequecy domain plot
doublefplot(DSBFC_f,f,[f_c-200,f_c+200],[-0.1,0.55],"gg");


% Plot envelop
env_t = envelope(dsbfc_t);    % Find envelope
ENV_f = fspect(env_t);
% Time domain plot
figure
plot(t*1e-3,env_t);
xlabel("time (ms)");
% Frequency domain plot
figure
yyaxis left
stem(f,real(ENV_f),'.');
ylim([-2.1,2.1]);
yyaxis right
stem(f,imag(ENV_f),'.');
ylim([-1.5,1.5]);
ytickformat('%gj');
xlim([-200,200]);
xlabel("frequency (Hz)");
title("Frequency Spectrum of Envelope");

%% Part b
ssbsc_t = SSBSC_AM_LSB(m_t,f_c,t);
SSBSC_f = fspect(ssbsc_t);
 % Time domain plot
figure
plot(t,ssbsc_t);
xlabel("time (s)");
% Frequecy domain plot
doublefplot(SSBSC_f,f,[f_c-200,f_c+200],[-2.1,2.1],"bb");


end
