clear
close all
Step_input;
Sinusoidal_double;
Sinusoidal_full;
Sinusoidal_half;
Impulse_input;
[N,M]=size(datmat);
[N2,M2]=size(datmat2);
[N3,M3]=size(datmat3);
[N4,M4]=size(datmat4);
[N5,M5]=size(datmat5);
m=2;
m2=4;
mass=0.9446;
k=437.2778;
c=8.5210;
omega_n=(k/mass)^0.5;
damping_ratio=c/mass/2/omega_n;
omega_d=omega_n*(1-damping_ratio^2)^0.5;
%% step
F0=0.75*3.35/0.05;
subplot(2,3,1);
for n=1:N
if datmat(n,m)>=3.00
break;
end
time(n)=datmat(n,m);
x_exp(n)=datmat(n,m2);
x(n)=F0/k*(1-(1/(1-damping_ratio^2)^0.5)*exp(-damping_ratio*omega_n*time(n))*cos(omega_d*time(n)-atan(damping_ratio/(1-damping_ratio^2)^0.5)));
end

hold on;
plot(time, x, 'b-');
%% sinusoidal input double
F0=0.2*3.35;
freq=omega_n/2;
r=freq/omega_n;
phi=atan(2*damping_ratio*r/(1-r^2));
X=F0/((k-m*freq^2)^2+c^2*freq^2)^0.5;
for n=1:N2
if datmat2(n,m)>=3.00
break;
end
time(n)=datmat2(n,m);
x_exp(n)=datmat2(n,m2);
x(n)=X*cos(omega_n*time(n)-phi);
end

subplot(2,3,2);
plot(time, x, 'b-');
%% sinusoidal input full
F0=0.2*3.35;
freq=omega_n;
r=freq/omega_n;
phi=atan(2*damping_ratio*r/(1-r^2));
X=F0/((k-m*freq^2)^2+c^2*freq^2)^0.5;
for n=1:N3
if datmat3(n,m)>=3.00
break;
end
time(n)=datmat3(n,m);
x(n)=X*cos(omega_n*time(n)-phi);
x_exp(n)=datmat3(n,m2);
end

subplot(2,3,3);
hold on;
plot(time, x, 'b-');
%% sinusoidal input half
F0=0.2*3.35;
freq=omega_n*2;
r=freq/omega_n;
phi=atan(2*damping_ratio*r/(1-r^2));
X=F0/((k-m*freq^2)^2+c^2*freq^2)^0.5;
for n=1:N4
if datmat4(n,m)>=3.00
break;
end
time(n)=datmat4(n,m);
x(n)=X*cos(omega_n*time(n)-phi);
x_exp(n)=datmat4(n,m2);
end

subplot(2,3,4);
hold on;
plot(time, x, 'b-');
%%
F0=3.35;
freq=omega_n/2;
r=freq/omega_n;
phi=atan(2*damping_ratio*r/(1-r^2));
X=F0/0.1675/((k-m*freq^2)^2+c^2*freq^2)^0.5;
for n=1:N5
if datmat5(n,m)>=3.00
break;
end

time(n)=datmat5(n,m);
x(n)=X*cos(omega_n*time(n)-phi);
x_exp(n)=datmat4(n,m2);
end

subplot(2,3,5);
plot(time, x, 'b-');