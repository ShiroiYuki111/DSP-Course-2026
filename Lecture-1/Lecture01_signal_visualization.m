%% Lecture 01: Signal Visualization in MATLAB
clear; clc; close all;

% Sampling parameters (high enough to avoid aliasing up to 10+ Hz)
fs = 1000;          % Sampling frequency (Hz)
duration = 1;       % Signal duration (seconds)
t = 0:1/fs:duration;

%% Task 1: Create a Sine Wave (A = 1, f = 5 Hz, 1 s)
A1 = 1;
f1 = 5;
y1 = A1 * sin(2 * pi * f1 * t);

figure('Name', 'Task 1: 5 Hz Sine Wave');
plot(t, y1, 'LineWidth', 1.5);
title('5 Hz Sine Wave (Amplitude = 1, Duration = 1 s)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Task 2: Compare Different Frequencies (2 Hz, 5 Hz, 10 Hz)
y_2hz  = sin(2 * pi * 2 * t);
y_5hz  = sin(2 * pi * 5 * t);
y_10hz = sin(2 * pi * 10 * t);

fig_freq = figure('Name', 'Task 2: Frequency Comparison');
subplot(3, 1, 1);
plot(t, y_2hz, 'LineWidth', 1.3);
title('Frequency = 2 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 2);
plot(t, y_5hz, 'LineWidth', 1.3);
title('Frequency = 5 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 3);
plot(t, y_10hz, 'LineWidth', 1.3);
title('Frequency = 10 Hz');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

saveas(fig_freq, 'frequency_comparison.png');

%% Task 3: Compare Different Amplitudes (0.5, 1, 2 at 5 Hz)
f_common = 5;
y_amp05 = 0.5 * sin(2 * pi * f_common * t);
y_amp1  = 1.0 * sin(2 * pi * f_common * t);
y_amp2  = 2.0 * sin(2 * pi * f_common * t);

fig_amp = figure('Name', 'Task 3: Amplitude Comparison');
subplot(3, 1, 1);
plot(t, y_amp05, 'LineWidth', 1.3);
title('Amplitude = 0.5 (Frequency = 5 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 2);
plot(t, y_amp1, 'LineWidth', 1.3);
title('Amplitude = 1 (Frequency = 5 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3, 1, 3);
plot(t, y_amp2, 'LineWidth', 1.3);
title('Amplitude = 2 (Frequency = 5 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

saveas(fig_amp, 'amplitude_comparison.png');

%% Task 4: Add Noise
rng(42); % Reproducible seed for random noise
clean_signal = sin(2 * pi * 5 * t);
noise = 0.3 * randn(size(t)); % Zero-mean Gaussian white noise
noisy_signal = clean_signal + noise;

fig_noise = figure('Name', 'Task 4: Clean vs. Noisy Signal');
subplot(2, 1, 1);
plot(t, clean_signal, 'LineWidth', 1.4);
title('Clean Sine Wave (5 Hz, Amplitude = 1)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2, 1, 2);
plot(t, noisy_signal, 'LineWidth', 1.1);
title('Noisy Sine Wave (Clean + Gaussian Noise)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

saveas(fig_noise, 'clean_vs_noisy_signal.png');