%% Lecture 02: Sampling and Aliasing
clear; clc; close all;

%% Task 1: Create the Original Signal (10 Hz sine wave, 1 second)
f_sig = 10;             % Original signal frequency (Hz)
amp = 1;                % Amplitude
duration = 1;           % Duration (seconds)
fs_cont = 10000;        % High rate to approximate continuous time
t_cont = 0:1/fs_cont:duration;
x_cont = amp * sin(2 * pi * f_sig * t_cont);

fig_orig = figure('Name', 'Task 1: Original 10 Hz Signal');
plot(t_cont, x_cont, 'LineWidth', 1.5);
title('Original Continuous-Time Approximation (10 Hz Sine Wave)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('10 Hz Sine Wave', 'Location', 'best');
grid on;
saveas(fig_orig, 'original_signal.png');

%% Task 2: Investigate Different Sampling Frequencies
fs_list = [15, 20, 25, 50, 100];
out_names = { ...
    'sampling_15Hz.png', ...
    'sampling_20Hz.png', ...
    'sampling_25Hz.png', ...
    'sampling_50Hz.png', ...
    'sampling_100Hz.png' ...
    };

for k = 1:numel(fs_list)
    fs = fs_list(k);
    Ts = 1 / fs;                    % Sampling period (s)
    t_s = 0:Ts:duration;            % Sample instants
    x_s = amp * sin(2 * pi * f_sig * t_s);

    fig_s = figure('Name', sprintf('Sampling at %d Hz', fs));
    plot(t_cont, x_cont, '-', 'LineWidth', 1.3);
    hold on;
    stem(t_s, x_s, 'o', 'LineWidth', 1.2, 'MarkerSize', 6);
    hold off;

    title(sprintf('10 Hz Signal Sampled at fs = %d Hz (Ts = %.4f s)', fs, Ts));
    xlabel('Time (s)');
    ylabel('Amplitude');
    legend('Original (10 Hz)', sprintf('Sampled (%d Hz)', fs), 'Location', 'best');
    grid on;

    saveas(fig_s, out_names{k});
end