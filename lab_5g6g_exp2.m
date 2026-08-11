clear; close all; clc;

%% Parameters
Fs = 1000;              % Sampling frequency
T = 1;                  % Total duration of one frame (1 sec)
N = 3;                  % Number of users
t = 0:1/Fs:T-1/Fs;      % Time vector

%% User Signals (Baseband)
user1 = sin(2*pi*5*t);  % User 1: 5 Hz sine
user2 = sin(2*pi*10*t); % User 2: 10 Hz sine
user3 = sin(2*pi*15*t); % User 3: 15 Hz sine

%% TDMA Time Slots
slot_length = length(t)/N; % Samples per slot
tdma_signal = zeros(1,length(t));

% Assign time slots
tdma_signal(1:slot_length) = user1(1:slot_length);
tdma_signal(slot_length+1:2*slot_length) = user2(slot_length+1:2*slot_length);
tdma_signal(2*slot_length+1:end) = user3(2*slot_length+1:end);

%% -------------PLOTS--------------
figure;

subplot(4,1,1);
plot(t, user1, 'LineWidth', 1.2);
title('User 1 Signal (5 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t, user2, 'LineWidth', 1.2);
title('User 2 Signal (10 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t, user3, 'LineWidth', 1.2);
title('User 3 Signal (15 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,4);
plot(t, tdma_signal, 'LineWidth', 1.2);
title('Multiplexed TDMA Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;