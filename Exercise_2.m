function Exercise_2
%EXERCISE_2 EXERCISE_1 Complete takes in exercise 1 of the practical brief

%% Setup
s_freq = 3e4;
t_period = 10;
[t,f] = make_t_f([0,t_period],s_freq);

disp(size(t));

% Define signal
x_t = exp(-1*(t-0.5)).*unitstep(t-0.5);
X_f = fspect(x_t);

% Deifne lowpass filter
H_f = cos((pi/3)*f).*unitstep(f+1.5).*unitstep(-f+1.5);

%% Part a

M_f = X_f.*H_f;
m_t = ifspect(M_f);

% Amplitude spectrum
figure
plot(f,abs(M_f))
xlim([-10,10])

% Phase spectrum
figure
plot(f,angle(M_f));
xlim([-10,10])

%% Part b
f_c = 1e4;  % Carrier Frequency
u_t = DSBSC_AM(m_t,f_c,t);
U_f = fspect(u_t);

figure()
plot(t,u_t);
xlabel("Time (s)")


figure
plot(f,abs(U_f));
xlim([f_c-4,f_c+4]);

figure
plot(f,real(U_f));
xlim([f_c-4,f_c+4]);
end

