function Exercise_2
%EXERCISE_2 Summary of this function goes here
%   Detailed explanation goes here

s_freq = 3e4;
t_period = 5;
f_c = 1e4;

[t,f] = make_t_f(0,t_period,s_freq);


x_t = exp(-1*(t-0.5)).*unitstep(t-0.5);
X_f = fspect(x_t);


H_f = cos((pi/3)*f).*unitstep(f+1.5).*unitstep(-f+1.5);


M_f = X_f.*H_f;
m_t = ifspect(M_f);


%% Part A

plot(f,abs(M_f))
xlim([-10,10])

figure
plot(f,angle(M_f),'-o');
xlim([-10,10])

%% Part B

u_t = DSBSC_AM(m_t,f_c,t);

figure()
plot(t,u_t);

U_f = fspect(u_t);

figure
plot(f,abs(U_f));
xlim([f_c-4,f_c+4]);
end

