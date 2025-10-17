% gibbs_demo.m
% Demonstrate Gibbs phenomenon for truncated Fourier series approximations
% of a ±1 square wave, period = 2*pi.

clear; close all; clc;

% time vector (dense so oscillations are visible)
t = linspace(-pi, pi, 4000);

% original square wave (amplitude +-1)
x_square = square(t);   % requires Signal Processing Toolbox; if not available, use sign(sin(t))

% series truncation values (largest odd harmonic to include)
K_values = [1, 3, 5, 15, 50];

% Prepare figure
figure('Units','normalized','Position',[0.05 0.05 0.8 0.6]);
hold on;

colors = lines(length(K_values));
legend_entries = cell(1, length(K_values));

% compute & plot approximations
for idx = 1:length(K_values)
    K = K_values(idx);
    x_rec = zeros(size(t));
    for k = 1:2:K     % odd harmonics only
        x_rec = x_rec + (4/pi) * (1/k) * sin(k * t);
    end
    plot(t, x_rec, 'Color', colors(idx,:), 'LineWidth', 1);
    legend_entries{idx} = sprintf('K = %d', K);
    % If you want to save/reuse x_rec, store in a matrix
end

% Plot original square wave on top (thicker black)
plot(t, x_square, 'k', 'LineWidth', 1.8);
legend_entries{end+1} = 'Original square';

xlabel('t (rad)');
ylabel('Amplitude');
title('Gibbs Phenomenon: Truncated Fourier Series Approximations of a Square Wave');
legend(legend_entries, 'Location', 'best');
xlim([-pi pi]);
grid on;

% Zoom in near a discontinuity to visualize the overshoot
figure('Units','normalized','Position',[0.05 0.05 0.6 0.4]);
% Pick the discontinuity at t = 0 (square wave jumps there)
t_zoom = linspace(-0.6, 0.6, 4000);
plot(t_zoom, square(t_zoom), 'k', 'LineWidth', 1.6); hold on;
for idx = 1:length(K_values)
    K = K_values(idx);
    x_rec = zeros(size(t_zoom));
    for k = 1:2:K
        x_rec = x_rec + (4/pi) * (1/k) * sin(k * t_zoom);
    end
    plot(t_zoom, x_rec, 'LineWidth', 1);
end
xlabel('t (rad)');
ylabel('Amplitude');
title('Zoom near discontinuity (t=0)');
legend([arrayfun(@(K) sprintf('K=%d',K), K_values, 'UniformOutput', false) {'Original'}], 'Location', 'best');
grid on;
xlim([-0.6 0.6]);

% Compute overshoot numerically for each K near the discontinuity at t = 0
disp('K    peak_value    overshoot_abs    overshoot_percent_of_jump    overshoot_percent_of_amplitude')
for idx = 1:length(K_values)
    K = K_values(idx);
    x_rec = zeros(size(t));
    for k = 1:2:K
        x_rec = x_rec + (4/pi) * (1/k) * sin(k * t);
    end
    % look in a small window around t=0, e.g. |t| < 0.6
    mask = abs(t) < 0.6;
    peak_value = max(x_rec(mask));
    overshoot_abs = peak_value - 1;               % amount above +1
    jump = 2;                                     % from -1 to +1
    overshoot_pct_jump = (overshoot_abs / jump)*100;       % % of jump
    overshoot_pct_amp = (overshoot_abs / 1)*100;          % % of amplitude (amplitude is 1)
    fprintf('%2d   %8.5f      %8.5f            %6.3f%%                 %6.3f%%\n', ...
            K, peak_value, overshoot_abs, overshoot_pct_jump, overshoot_pct_amp);
end
