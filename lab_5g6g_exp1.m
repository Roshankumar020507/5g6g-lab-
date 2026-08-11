clear;close all;clc;

%%Parameters
Fs=600e3;
t=0:1/Fs:5e-3;
fm=5e3;
fc=20e3;

%%Message signal
m=sin(2*pi*fm*t);

%%Carrier signal
c=cos(2*pi*fc*t);

%%Modulated signal(DSB-SC)
s=m.*c;

%%------------------------PLOTTING------------------------

figure;

subplot(4,1,1);
plot(t(1:1000),m(1:1000), 'LineWidth' , 1.3 ) ;
title('Message Signal(5 kHz)');
xlabel('Time(s)'); ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t(1:1000),s(1:1000),'LineWidth',1.3);
title('Modulated Signal(Message x Carrier)');
xlabel('Time(s)'); ylabel('Amplitude');
grid on;

%%------------------SPECTRUM--------------------

N=length(s);
S=abs(fff(s)/N);
f=(-N/2:N/2-1)*(Fs/N);

subplot(4,1,4);
plot(f,fftshift(S), 'LineWidth',1.3);
xlabel('Frequency(Hz)');
ylabel('Magnitude');
grid on;
xlim([0 40e3]); %show 0–40 kHz 


%% ----------- FIND PEAK FREQUENCY (Verification) -----------
 [~, idx] = max(fftshift(S));
 peak_freq = f(idx); 
 fprintf("\nSpectrum Peak Detected at = %.1f kHz\n", peak_freq/1000); 