
% Plots

% Colores
redd ='#A2142F';
orangee = '#D95319';
bluee = '#0072BD';
greenn = '#77AC30';
purplee = '#7E2F8E';
yelloww = '#EDB120';
pinkk = '#ffafcc';
brownn = '#7f4f24';

defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
newWidth = defaultPos(3) * 2;                           % Modify multiplier as needed
figure('Position', [defaultPos(1:2) newWidth defaultPos(4)]);

torque = out.get('torque');
plot(torque.Time, torque.Data, 'Color', orangee, 'LineWidth', 1.5);
title('T_l (t)');
xlabel('Tiempo (s)');
ylabel('Torque (N.m)');
grid on;
grid minor;
set(gca, 'FontSize', 12);
% axis tight;
% xlim([0, 1]);                           % X-axis limits
% ylim([-5, 275]);                        % Y-axis limits
saveas(gcf, 't_l_LTI.png');           % .fig, .png, .jpg, .pdf, .eps, etc.