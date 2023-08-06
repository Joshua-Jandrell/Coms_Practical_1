function Exercise_1
%EXERCISE_1 Complete takes in exercise 1 of the practical brief

%% Setup
s_freq = 1e7;           % Sampling frequency (Nyquist Rate)
t_period = [0,1/25];    % Time period 
[t,f] = make_t_f(t_period,s_freq);


%% Define and plot the message signal
m_t = 4*cos(100*pi*t)+3*sin(200*pi*t)+3*sin(300*pi*t);
M_f = fspect(m_t);  % Frequency spectrum

% time domain
figure
plot(t*1e3,m_t);
xlabel("time (ms)");

% frequency domain
figure
% plot real components
yyaxis left
stem(f,real(M_f),'.');
ylim([-2.1,2.1]);
% plot imaginary components on a new axis
yyaxis right
stem(f,imag(M_f),'.');
ylim([-2.1,2.1]);
ytickformat('%gj');
xlim([-200,200]);
xlabel("frequency (Hz)");
title("Frequency spectrum of message signal, M(f)");

%% DSB-FC (Part a)
f_c = 1e6; % Carrier frequency

dsbfc_t = DSBFC_AM(m_t,f_c,0.7,t);  % Find modulated signal in time domain
DSBFC_f = fspect(dsbfc_t);          % Convert to frequency domain

% Plot signal in time domain
% Show 2 full message periods
figure
plot(t*1e3,dsbfc_t);
xlabel("time (ms)");

% Show only first 25 µs so that carrier is clearly visisble
figure
plot(t*1e6,dsbfc_t);
xlim([0,25*1e6/f_c]);
xlabel("time (µs)");

% Frequency domain plot
doublefplot(DSBFC_f,f,[f_c-200,f_c+200],[-0.1,0.55],"");


% find and plot envelope
env_t = envelope(dsbfc_t);
ENV_f = fspect(env_t);

% Time domain plot
figure
plot(t*1e3,env_t);
xlabel("time (ms)");
ylim([0,1.8]);
% Frequency domain plot
figure
yyaxis left
stem(f,real(ENV_f),'.');
ylim([-0.25,1.25]);
yyaxis right
stem(f,imag(ENV_f),'.');
ylim([-0.25,1.25]);
ytickformat('%gj');
xlim([-200,200]);
xlabel("frequency (Hz)");

%% Part b
ssbsc_t = SSBSC_AM_LSB(m_t,f_c,t);
SSBSC_f = fspect(ssbsc_t);
 % Time domain plot
figure
plot(t*10e3,ssbsc_t);
xlabel("time (ms)");
% First 25µs
figure
plot(t*1e6,ssbsc_t);
xlim([0,25*1e6/f_c]);
xlabel("time (µs)");

% Frequecy domain plot
doublefplot(SSBSC_f,f,[f_c-200,f_c+200],[-2.1,2.1],"");


end
